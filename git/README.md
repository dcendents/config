Git
======

Renaming a remote branch: 

	git push <remote> <remote>/<old_name>:refs/heads/<new_name> :<old_name>

Deleting a remote branch: 

	git push <remote> :<branch_name>

Push all branches

	export SRC_REMOTE=svn
	export DST_REMOTE=origin
	for a in $(git branch --list --remote "${SRC_REMOTE}/*" | grep -v --regexp='->') do git push "${DST_REMOTE}" "${a}:refs/heads/${a//${SRC_REMOTE}\/}" done