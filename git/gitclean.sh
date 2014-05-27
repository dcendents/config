#! /bin/sh


        #git filter-branch --commit-filter 'git_commit_non_empty_tree "$@"'  -- --all
        #git reset --hard
        #git for-each-ref --format="%(refname)" refs/original/ | xargs -n 1 git update-ref -d
        #git reflog expire --expire=now --all
        #git gc --aggressive --prune=now
        #git count-objects -v
        #git rev-list HEAD --count --all


let NO_COMMITS=1

let REMAINING_COMMITS=0

until [ $NO_COMMITS -eq $REMAINING_COMMITS ]
do
    let NO_COMMITS=$(git rev-list HEAD --count --all)
    git filter-branch --commit-filter 'git_commit_non_empty_tree "$@"'  -- --all
    git reset --hard
    git for-each-ref --format="%(refname)" refs/original/ | xargs -n 1 git update-ref -d
    git reflog expire --expire=now --all
    git gc --aggressive --prune=now
    git count-objects -v
    let REMAINING_COMMITS=$(git rev-list HEAD --count --all)
done

