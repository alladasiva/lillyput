# lillyput

#pwd-change.yml - RESET PWD 
Usage:  ansible-playbook pwd-change.yml -e "user=username newpassword=defaultpwd"
Prerequisites: link inventory to main.yml (ln -s inventory main.yml)
Activity:  Updating password to defaultpwd & forcing user to update password in first login

#

