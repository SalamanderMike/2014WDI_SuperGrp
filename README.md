# basic setup:
```
<forked on github>

git clone https://github.com/{own-name}/{name-of-repo}.git .           # clones repo to local machine

git branch dev                                                         # creates a development branch

git checkout dev                                                       # switches to that branch

git remote add upstream https://github.com/siejen/{name-of-repo}.git     # adds this as the upstream (i.e. master copy)
	Note for this last line: make sure you replace the https: with git: 
	[copy/pasting the address will paste the https:]
```


# workflow:
```
git pull upstream                          # syncs with any other team member changes made in meantime

<make some edits>                          # coding away!

git push -u origin dev                     # pushes to the dev branch on your github

<make some edits>                          # hamster coding party!

git push -u origin dev                     # pushes to the dev branch on your github

<satisfied with edits...>                  # code is so clean

git checkout master                        # switch back to master branch

git merge dev                              # merge changes to master branch

git push -u origin master                  # pushes to master branch on your github

<make a pull request on github from>       # asks owner of master repo to pull in changes
```
