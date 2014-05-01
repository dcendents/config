Git
======

[TOC]

* toc
{:toc}

#### Renaming a remote branch: 

	git push <remote> <remote>/<old_name>:refs/heads/<new_name> :<old_name>

#### Deleting a remote branch: 

	git push <remote> :<branch_name>

#### Push all branches from a remote to another one

	export SRC_REMOTE=svn
	export DST_REMOTE=origin
	for a in $(git branch --list --remote "${SRC_REMOTE}/*" | grep -v --regexp='->') do git push "${DST_REMOTE}" "${a}:refs/heads/${a//${SRC_REMOTE}\/}" done

#### List all files from history
    git log --pretty=format: --name-only --diff-filter=A | sort -

#### Make a file executable

	git update-index --chmod=+x <the_file>

## Git clone from Subversion

#### Convert the project using subgit (faster, more reliable and gives better results than git-svn)
    subgit.bat import --trunk trunk --branches branches --tags tags --username dbeland --password ******** --non-interactive  --svn-url https://... {projectName}.git

#### Clone the project to perform the work
    git clone file://C:/Path/To/Project.git

#### Convert remote branches to to local branches
    git for-each-ref refs/remotes | cut -d / -f 4- | grep -v @ | while read branchname; do git branch "$branchname" "refs/remotes/origin/$branchname"; git branch -r -d "origin/$branchname"; done

#### Remove the remote origin
    git remote rm origin

#### Split up the project into modules (as necessary)
    git filter-branch --tag-name-filter cat --prune-empty --subdirectory-filter {folder} -- --all
    git reset --hard
    git for-each-ref --format="%(refname)" refs/original/ | xargs -n 1 git update-ref -d
    git reflog expire --expire=now --all
    git gc --aggressive --prune=now

	    If error fatal: Out of memory, malloc failed (tried to allocate xxx bytes), then reducing the number of threads or memory might help
		    git config pack.threads 4
		    git config pack.windowMemory 256m

If the module has been renamed, it's nearly impossible to extract it, instead remove all other folders (see below)

#### Remove big files from git
Use WinDirStat to find big files
Or Identify the project size and biggest files (even deleted files)
    
    git gc
    git count-objects -v
    ls -1 .git/objects/pack/*.idx | xargs git verify-pack -v | sort -n -k 3,4 | tail -30
    git rev-list --objects --all | grep {filehash}
    git log --pretty=oneline --branches --follow --all -- {filename}

#### Remove a directory recursively
    git filter-branch --tag-name-filter cat --prune-empty --index-filter "git rm --cached --ignore-unmatch -r '{dirname}'" -- --all

#### remove file
    git filter-branch --tag-name-filter cat --prune-empty --index-filter "git rm --cached --ignore-unmatch '{filename}'" -- --all

#### Delete refs, logs and repack
    git for-each-ref --format="%(refname)" refs/original/ | xargs -n 1 git update-ref -d
    git reflog expire --expire=now --all
    git gc --aggressive --prune=now
    git count-objects -v

#### rename a directory (when module cannot be extracted because the firectory had been renamed at some point)
    git filter-branch --tag-name-filter cat --prune-empty --index-filter 'git ls-files -s | sed "s-\t{folder}/\"*-\t{new_folder}/-" | GIT_INDEX_FILE=$GIT_INDEX_FILE.new git update-index --index-info && mv "$GIT_INDEX_FILE.new" "$GIT_INDEX_FILE"' -- --all

#### delete all files except
    git filter-branch --tag-name-filter cat --prune-empty --index-filter "git rm --cached -r . && git reset $GIT_COMMIT {file_to_keep}" -- --all


#### Batch remove files

See scripts:
  * gitrm.sh
  * gitrmdir.sh dirname

#### Push to git
    git remote add origin https://...
    git push origin -u --all
    git push origin --tags



