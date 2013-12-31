My cross platform (Linux, MacOS, Solaris, Windows, FreeBSD, OpenBSD)
user configuration files.


### Philosophy ###

1. Document everything, use long-hand options where possible. I want
   to be able to grok even the obscure bits months from now.
2. Don't be too opinionated, don't go remapping keys willy-nilly,
   it'll just cause pain when you have to use someone else's session.


### Installation ###

Comes with (optional) [ansible playbook](http://www.ansibleworks.com)
install.yml to automate the installation of dotfiles and associated
setup tasks.

Start with a vanilla user (Fedora 19):

    [testing@r4 ~]$ ls -lrta
    total 24
    -rw-r--r--. 1 testing testing  124 Mar 11  2013 .bashrc
    -rw-r--r--. 1 testing testing  193 Mar 11  2013 .bash_profile
    -rw-r--r--. 1 testing testing   18 Mar 11  2013 .bash_logout
    drwxr-xr-x. 4 testing testing 4096 Oct 31 00:46 .mozilla
    drwxr-xr-x. 9 root    root    4096 Dec 31 00:14 ..
    drwx------. 3 testing testing 4096 Dec 31 00:14 .

Clone the dotfiles repo:

    [testing@r4 ~]$ git clone https://github.com/CraigJPerry/dotfiles.git .dotfiles
    Cloning into '.dotfiles'...
    remote: Reusing existing pack: 258, done.
    remote: Counting objects: 3, done.
    remote: Compressing objects: 100% (3/3), done.
    remote: Total 261 (delta 0), reused 1 (delta 0)
    Receiving objects: 100% (261/261), 72.99 KiB | 127.00 KiB/s, done.
    Resolving deltas: 100% (138/138), done.

Run the playbook to install the dotfiles:

    [testing@r4 ~]$ cd .dotfiles/
    [testing@r4 .dotfiles]$ ansible-playbook --connection=local --inventory-file=localhost, install.yml

    PLAY [all] ********************************************************************

    GATHERING FACTS ***************************************************************
    ok: [localhost]

    TASK: [BACKUP | Make Backup Folder: ~/.dotfiles.old] **************************
    changed: [localhost]

    TASK: [BACKUP | Backup Old Dotfiles] ******************************************
    changed: [localhost] => (item={'dest': '.bashrc', 'source': 'bashrc'})
    changed: [localhost] => (item={'dest': '.bash_profile', 'source': 'bash_profile'})
    changed: [localhost] => (item={'dest': '.bash_logout', 'source': 'bash_logout'})
    failed: [localhost] => (item={'dest': '.gitconfig', 'source': 'gitconfig'}) => {"failed": true, "item": {"dest": ".gitconfig", "source": "gitconfig"}}
    msg: could not find src=/home/testing/.gitconfig
    ...ignoring
    failed: [localhost] => (item={'dest': '.vimrc', 'source': 'vimrc'}) => {"failed": true, "item": {"dest": ".vimrc", "source": "vimrc"}}
    msg: could not find src=/home/testing/.vimrc
    ...ignoring

    TASK: [INSTALL DOTFILES | Link New Dotfiles] **********************************
    changed: [localhost] => (item={'dest': '.bashrc', 'source': 'bashrc'})
    changed: [localhost] => (item={'dest': '.bash_profile', 'source': 'bash_profile'})
    changed: [localhost] => (item={'dest': '.bash_logout', 'source': 'bash_logout'})
    changed: [localhost] => (item={'dest': '.gitconfig', 'source': 'gitconfig'})
    changed: [localhost] => (item={'dest': '.vimrc', 'source': 'vimrc'})

    TASK: [CHECK | Effective User ID] *********************************************
    ok: [localhost]

    TASK: [INSTALL VIM PLUGINS | Pre-requisite RPMs] ******************************
    ok: [localhost] => (item=vim-enhanced,python-pip)

    TASK: [INSTALL VIM PLUGINS | Pre-requisite Python Modules] ********************
    ok: [localhost] => (item=jedi)
    ok: [localhost] => (item=pylint)
    ok: [localhost] => (item=pep8)

    TASK: [INSTALL VIM PLUGINS | Vim Bundle Directory] ****************************
    changed: [localhost]

    TASK: [INSTALL VIM PLUGINS | Vundle Plugin Manager] ***************************
    changed: [localhost]

    TASK: [INSTALL VIM PLUGINS | Install Vundle Bundles] **************************
    changed: [localhost]

    TASK: [DIRS | Public Code] ****************************************************
    changed: [localhost]

    TASK: [DIRS | Gists] **********************************************************
    changed: [localhost]

    TASK: [DIRS | 3rd Party] ******************************************************
    changed: [localhost]

    TASK: [ROLLBACK | Delete Linked Dotfiles] *************************************
    skipping: [localhost] => (item={'dest': '.bashrc', 'source': 'bashrc'})
    skipping: [localhost] => (item={'dest': '.bash_profile', 'source': 'bash_profile'})
    skipping: [localhost] => (item={'dest': '.bash_logout', 'source': 'bash_logout'})
    skipping: [localhost] => (item={'dest': '.gitconfig', 'source': 'gitconfig'})
    skipping: [localhost] => (item={'dest': '.vimrc', 'source': 'vimrc'})

    TASK: [ROLLBACK | Restore Backups] ********************************************
    skipping: [localhost] => (item={'dest': '.bashrc', 'source': 'bashrc'})
    skipping: [localhost] => (item={'dest': '.bash_profile', 'source': 'bash_profile'})
    skipping: [localhost] => (item={'dest': '.bash_logout', 'source': 'bash_logout'})
    skipping: [localhost] => (item={'dest': '.gitconfig', 'source': 'gitconfig'})
    skipping: [localhost] => (item={'dest': '.vimrc', 'source': 'vimrc'})

    PLAY RECAP ********************************************************************
    localhost                  : ok=15   changed=9    unreachable=0    failed=0

If i ever need to rollback, any changed dotfiles will be reverted:

    [testing@r4 .dotfiles]$ ansible-playbook --connection=local --inventory-file=localhost, install.yml --tags rollback

    PLAY [all] ********************************************************************

    GATHERING FACTS ***************************************************************
    ok: [localhost]

    TASK: [ROLLBACK | Delete Linked Dotfiles] *************************************
    ok: [localhost] => (item={'dest': '.bashrc', 'source': 'bashrc'})
    ok: [localhost] => (item={'dest': '.bash_profile', 'source': 'bash_profile'})
    ok: [localhost] => (item={'dest': '.bash_logout', 'source': 'bash_logout'})
    ok: [localhost] => (item={'dest': '.gitconfig', 'source': 'gitconfig'})
    ok: [localhost] => (item={'dest': '.vimrc', 'source': 'vimrc'})

    TASK: [ROLLBACK | Restore Backups] ********************************************
    changed: [localhost] => (item={'dest': '.bashrc', 'source': 'bashrc'})
    changed: [localhost] => (item={'dest': '.bash_profile', 'source': 'bash_profile'})
    changed: [localhost] => (item={'dest': '.bash_logout', 'source': 'bash_logout'})
    failed: [localhost] => (item={'dest': '.gitconfig', 'source': 'gitconfig'}) => {"failed": true, "item": {"dest": ".gitconfig", "source": "gitconfig"}}
    msg: could not find src=/home/testing/.dotfiles.old/gitconfig
    ...ignoring
    failed: [localhost] => (item={'dest': '.vimrc', 'source': 'vimrc'}) => {"failed": true, "item": {"dest": ".vimrc", "source": "vimrc"}}
    msg: could not find src=/home/testing/.dotfiles.old/vimrc
    ...ignoring

    PLAY RECAP ********************************************************************
    localhost                  : ok=3    changed=1    unreachable=0    failed=0

