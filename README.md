My cross platform (Linux, MacOS, Solaris, Windows, FreeBSD, OpenBSD)
user configuration files with script to automate install / setup.


## Philosophy ##

1. Document everything, use long-hand options where possible. I want
   to be able to grok even the obscure bits months from now.
2. Don't be too opinionated, don't go remapping keys willy-nilly,
   it'll just cause pain when you have to use someone else's session.


## Using ##

1. Fork this repo
2. git clone it to the destination user account on you host
3. Run the movein.sh or movein.bat script (preserves existing
   configuration for easy uninstall if required)

To uninstall and revert to prior configuration run moveout.sh
or moveout.bat as appropriate for the platform.


## Hacking ##

1. Make changes in a branch other than master
2. Application specific config goes in a named dir under apps/
3. OS specific config goes in a named dir under platform/
4. Version specific subdirs under either of these are permitted
   if required

