# pillage-svn
Tool to recursively download versioned source code from .svn directories

I wrote this simple shell script because I could not find any tool on the Internet that:
- recursively download all sub-directories
- download all svn:externals 

Below are the tools I know of:

- Metasploit svn_scanner module but it currently does not seem to follow sub-directories
- https://github.com/damnsecure/FlowerMonkey but it does not seem to download sub-directories
- https://github.com/anantshri/svn-extractor but it does not seem to download svn:externals
- https://github.com/NetSPI/SVNentriesParser was released after I wrote pillage-svn, will need to try it out! :) 
