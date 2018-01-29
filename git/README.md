Git
======

[TOC]

* toc
{:toc}

#### Renaming a remote branch: 

	git push <remote> <remote>/<old_name>:refs/heads/<new_name> :<old_name>

#### Deleting a remote branch: 

	git push <remote> :<branch_name>

#### Track every remote branch and synchronize them: 

```bash
export REMOTE=origin
git fetch ${REMOTE} --prune
for r in $(git branch --list --remote "${REMOTE}/*" | grep -v --regexp='->'); do git checkout -B ${r##${REMOTE}/} --track $r ; done
git checkout master
```

#### Prune branches: 
##### Prune remote branches

	git fetch <remote> --prune
	
##### Delete all local branches which have been merged into the current branch

	git branch --merged | grep -v "\*" | xargs -n 1 git branch -d

#### Push all branches from a remote to another one

	export SRC_REMOTE=svn
	export DST_REMOTE=origin
	for a in $(git branch --list --remote "${SRC_REMOTE}/*" | grep -v --regexp='->') do git push "${DST_REMOTE}" "${a}:refs/heads/${a//${SRC_REMOTE}\/}" --tags done

#### List all files from history
    git log --pretty=format: --name-only --diff-filter=A | sort -

#### Make a file executable

It seems staging (adding) the modified script before committing does not work, or using the -a switch to git commit. To work properly, start from a clean state and run the following 2 commands.

	git update-index --chmod=+x <the_file>
    git commit -m "Making script executable"

#### Forcing LF line ending on windows

Mainly for bash scripts to run under cygwin. Create a file .gitattributes with the following format:

	gradlew text eol=lf

#### Restore a deleted file
##### Find the file:

	git log --diff-filter=D --summary | grep delete
	
##### Find the commit

	git log --diff-filter=D --summary > list.txt
	
##### Restore the file

	git checkout <commit>~1 filename

#### List all commits between 2 branches

	git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit {branch1}..{branch2}

#### Cloning over a bad connection

If git clone fails, the work around to do a full clone gradually is with the following commands:

	git clone https://server/{project}.git --depth=1 --no-single-branch
	cd {project}
	git fetch origin --depth=N 		#do it mutiple times, increasing N each time
	git fetch origin --unshallow 	#to fetch all that is remaining

## Git clone from Subversion

#### Convert the project using subgit (faster, more reliable and gives better results than git-svn)
    set JAVA_OPTS=-Xverify:none -Djava.awt.headless=true -Dsubgit.svn.connectTimeout=300000 -Dsubgit.svn.readTimeout=600000
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

#### rename a directory (when module cannot be extracted because the directory had been renamed at some point)
    git filter-branch --tag-name-filter cat --prune-empty --index-filter 'git ls-files -s | sed "s-\t{folder}/\"*-\t{new_folder}/-" | GIT_INDEX_FILE=$GIT_INDEX_FILE.new git update-index --index-info && mv "$GIT_INDEX_FILE.new" "$GIT_INDEX_FILE"' -- --all

#### delete all files except
    git filter-branch --tag-name-filter cat --prune-empty --index-filter "git rm --cached -r . && git reset $GIT_COMMIT {file_to_keep}" -- --all

#### delete empty commits from history
    git filter-branch --commit-filter 'git_commit_non_empty_tree "$@"'  -- --all
    git reset --hard
    git for-each-ref --format="%(refname)" refs/original/ | xargs -n 1 git update-ref -d
    git reflog expire --expire=now --all
    git gc --aggressive --prune=now
    git count-objects -v
    git rev-list HEAD --count --all

#### Batch scripts

See scripts:
  * gitrm.sh
    * Query biggest files and ask which one should be removed
  * gitrmdir.sh dirname
    * Remove files or directory recursively
  * gitclean.sh
    * Clean empty commits from the history, keep runing until there are no more to remove

#### Push to git
    git remote add origin https://...
    git push origin -u --all
    git push origin --tags



