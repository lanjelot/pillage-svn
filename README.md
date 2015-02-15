# pillage-svn
Tool to recursively download versioned source code from .svn directories (pre Subversion-1.7 "WC-NG" format).

Prior to Subversion 1.7 there would be a .svn directory in every directory of the working copy. Starting with version 1.7 Subversion uses a single centralized .svn folder in the root of the working copy (new format code named [WC-NG](http://subversion.apache.org/docs/release-notes/1.7.html#wc-ng)).

I wrote this simple shell script because back in Feb 2013 I could not find any tool that would:
- recursively download all the sub-directories
- download all the svn:externals

Below are the tools I am aware of:

- Metasploit svn_scanner module but it did not seem to follow sub-directories
- https://github.com/damnsecure/FlowerMonkey but it did not seem to download sub-directories
- https://github.com/anantshri/svn-extractor but it did not seem to download svn:externals
- https://github.com/NetSPI/SVNentriesParser was released after I wrote pillage-svn, haven't tried it out 
- https://github.com/kost/dvcs-ripper was released after I wrote pillage-svn, haven't tried it out
