Git
======

Renaming a remote branch: 

	git push <remote> <remote>/<old_name>:refs/heads/<new_name> :<old_name>

Deleting a remote branch: 

	git push <remote> :<branch_name>

Push all branches

	for a in $(git branch --list --remote "<remote_src>/*" | grep -v --regexp='->') do git push "<remote_dest>" "${a}:refs/heads/${a//<remote_src>\/}" done
	
