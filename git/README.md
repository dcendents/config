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


## Git clone from Subversion


	git svn clone --stdlayout --preserve-empty-dirs --placeholder-filename=.temp --prefix=svn/ --username=username http://...

	git for-each-ref refs/remotes/svn/tags --shell --format="r=%(refname:short) t=\${r#svn/tags/}" | while read e; do eval "$e"; git tag -f $t refs/remotes/$r; git branch -d -r $r; done

	git svn create-ignore
	git commit -m "migrating the svn:ignore properties"

	git svn show-externals

	git remote add origin https://...

	git push origin master --set-upstream --tags

	export SRC_REMOTE=svn; 
	export DST_REMOTE=origin; 
	for a in $(git branch --list --remote "${SRC_REMOTE}/*" | grep -v --regexp='->' | grep -v "${SRC_REMOTE}/trunk"); do git push "${DST_REMOTE}" "${a}:refs/heads/${a//${SRC_REMOTE}\/}"; done



	