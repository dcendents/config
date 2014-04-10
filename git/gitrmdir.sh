#! /bin/sh

for var in "$@"
do
	DIRS=$(echo "${DIRS} '${var}'")
done

git filter-branch --tag-name-filter cat --prune-empty --index-filter "git rm --cached --ignore-unmatch -r ${DIRS}" -- --all

# Delete refs, logs and repack
git for-each-ref --format="%(refname)" refs/original/ | xargs -n 1 git update-ref -d
git reflog expire --expire=now --all
git gc --aggressive --prune=now
git count-objects -v

