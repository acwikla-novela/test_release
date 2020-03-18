#!/bin/bash

# current Git branch
branch=$(git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,')

# current project name
projectName=$(git config --local remote.origin.url|sed -n 's#.*/\([^.]*\)\.git#\1#p')

# establish master branch name variables
masterBranch=$branch

# checkout to master branch, this will break if the user has uncommited changes
git checkout $masterBranch

# master branch validation
if [ $branch = "master" ]; then
	echo "Enter the release version number"

	read versionNumber

	# v1.0.0, v1.7.8, etc..
	versionLabel=v$versionNumber
	releaseBranchName=release_master

	# establish tag name variables
	tagName=$versionLabel

	echo "Started releasing $versionLabel for $projectName ....."

	# pull the latest version of the code from master
	git pull

  git commit -m $$$$$$$$$$$$$$$$$$$$$releaseBranchName
	# create tag for new version from -master
	git tag $tagName

	# push commit to remote origin
	git push

	# push tag to remote origin
	git push --tags origin

	echo "$versionLabel is successfully released for $projectName ...."

	# checkout to master branch
	git checkout $masterBranch

	# pull the latest version of the code from master
	git pull

	echo "Bye!"

else
	echo "Please make sure you are on master branch and come back!"
	echo "Bye!"
fi


sleep 30