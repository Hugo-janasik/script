#!/bin/sh

function pushFunction() {
    npm run lint
    if [ $? -eq 0 ]
    then
        git -C $PWD/ push origin $1
    fi
}

function commitFunction() {
    git -C $PWD/ commit -m $1
}

if [ $# -eq 0 ]
then
    echo 'g push + branch name\ng commit + commit name'
    exit
fi
if [ $1 == 'push' ] && [ ! -z $2 ]
then
    pushFunction $2
    echo 'Push complete'
    exit
fi
if [ $1 == 'commit' ] && [ ! -z $2 ]
then
    commitFunction $2
    echo 'Commit complete'
    exit
fi
echo 'g push + branch name'
echo 'g commit + commit name'
