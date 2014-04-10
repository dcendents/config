#! /bin/sh

NO_FILES=$1
if [ -z "$1" ]
then
	NO_FILES=30
fi

LIST=list.txt
ls -1 .git/objects/pack/*.idx | xargs git verify-pack -v | sort -r -n -k 3,4 | head -${NO_FILES} > ${LIST}

FILES=""

let DO_DELETE=0
while read line
do
	echo ""

	FILE_HASH=$(echo $line | cut -d ' ' -f 1)
	#echo $FILE_HASH
	
	# File size
	FILE_SIZE=$(echo $line | cut -d ' ' -f 3)
	echo -n "${FILE_SIZE}:  "
	
	FILE=$(git rev-list --objects --all | grep ${FILE_HASH} | cut -d ' ' -f 2-)
	echo $FILE
	
	read -n1 -r -p "Remove file? y/n [n]" key </dev/tty
	echo ""
	
	if [ "$key" = 'y' ]
	then
		let DO_DELETE=1
		FILES=$(echo "${FILES} '${FILE}'")
	fi
done < ${LIST}

if [ $DO_DELETE -eq 1 ]
then
	echo ${FILES}
	git filter-branch --tag-name-filter cat --prune-empty --index-filter "git rm --cached --ignore-unmatch ${FILES}" -- --all
	git for-each-ref --format="%(refname)" refs/original/ | xargs -n 1 git update-ref -d
	git reflog expire --expire=now --all
	git gc --aggressive --prune=now
	git count-objects -v
fi

#FILE=$(git rev-list --objects --all | grep $1 | cut -d ' ' -f 2-)
#echo $FILE

#read -n1 -r -p "Press any key to continue..." key

#git log --pretty=oneline --branches --follow --all -- '$FILE'

#read -n1 -r -p "Press any key to continue..." key


# remove file
	#first commit hash known: git filter-branch --tag-name-filter cat --prune-empty --index-filter 'git rm --cached --ignore-unmatch {filename}' -- --all
	#hash unknown: git filter-branch --tag-name-filter cat --prune-empty --index-filter "git rm --cached --ignore-unmatch '{filename}'" -- --all
	

