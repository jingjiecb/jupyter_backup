#!/bin/bash
# this script backup your current work directory to your remote repository

# note: before you use this, you must have installed git, user.name and user.email have been configured
# if not, use apt install git to install git and run the following command to config user.name and user.email
# git config --global user.name yourname
# git config --global user.email youremail@example.com


# you can change this value to config the remote url on github or your own remote repository
GIT_REMOTE_URL="git@github.com:jingjiecb/jupyter_backup.git"
# here to set your project name for commit message
PROJECT_NAME="jupyter notebook"

SHELL_FOLDER=$(cd "$(dirname "$0")";pwd)
cd $SHELL_FOLDER
if [ ! -d ".git" ]; then
        git init
        git remote add origin $GIT_REMOTE_URL
        echo "#script for backup" >> .gitignore
        echo "$(basename $0)" >> .gitignore
fi
git add -A
git commit -m "update $PROJECT_NAME at `date`"
git push -u origin master
cd -