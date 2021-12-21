read -p "Enter the New Branch name to create :" nbname
read -p "Enter your repository name:" repo
read -p "Enter your User name:" uname
read -p "Enter PAT ( personal Access Token) : " token
#read -p "Enter owner name of repository :" owner
#getting the master branch as reference
SHA=$( curl -s -u $uname:$token https://api.github.com/repos/$uname/$repo/git/refs/heads/master | jq -r '.object.sha' )
#posting the request to github to create branch....
curl -s -X POST \
     -u $uname:$token \
     -H "Content-Type: application/json" \
     -d '{"ref": "refs/heads/'$nbname'", "sha": "'$SHA'"}'  https://api.github.com/repos/$uname/$repo/git/refs

if [ $? -eq 0 ]
then
 echo "your Branch created with name : " $nbname
else
 echo " something went wrong while creating branch , check the result:"
fi

