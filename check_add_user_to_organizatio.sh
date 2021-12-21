#input variable for username & organization....
read -p "Enter the username to check :" uname
read -p "Enter organ.Name:" orgname
#find the user and convert it to string....
mur=$(curl https://api.github.com/orgs/$orgname/members | grep "login")
#Display available user in organization string...
echo "$mur"
#converting to arrya by splitting at Delimitor " ...
arr=(`echo $mur| tr '"' ' '`)
#find the user name from arrya..
echo " user name : ${arr[2]}"
#chech user is exists in the organization..
if [ ${arr[2]} == $uname ] 
 then 
  echo "user '$uname' found in org : $orgname"
 else
  echo "no user found with '$uname' in org :$orgname"
  read -p "Do you want to send invite to add user? then select (yes/no):" yesRno
  flag=$yesRno 
  if [ $yesRno == $flag ]|[ $yesRno == $flag ]
   then
      echo "you selected :$yesRno"
#requesting emailid from user to invite...
      read -p "Enter valid mail to send invite (ex:your@example.com) : " mailid
#sending posting request to github using git api....
        curl \
  	-X POST \
  	-u muragan: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 \
	-H "Accept: application/vnd.github.v3+json" \
  	https://api.github.com/orgs/$orgname/invitations \
  	-d '{"email":"$mailid"}'
	if [ $? -eq 0 ]
	 then
	 echo "sent invitation successfully to : $emailid"
	else
	 echo "some error with your email,check your email"
	fi
   else
      echo "you selected:$yesRno"
   fi
fi
