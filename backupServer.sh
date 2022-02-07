#!/bin/bash
dir=/home/ec2-user/Tachyon-Server
if [ -d "$dir" ]; then
	    branch=$(git --git-dir "$dir/.git" branch | sed -n -e 's/^\* \(.*\)/\1/p')
	    status=$(git --git-dir "$dir/.git" --work-tree=$dir status)
	    git --git-dir="$dir/.git" add *
	    git --git-dir="$dir/.git" commit -m 'Backing up Server...'
	    git --git-dir="$dir/.git" push
	else
		    branch='.git dir not found'
		        status=''
fi

echo
echo "* Folder: $dir/.git"
echo "* Branch: $branch"
echo "* Status:"
echo
echo "$status"
echo
