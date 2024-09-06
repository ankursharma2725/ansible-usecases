# ansible-usecases
use cases to deploy components using ansible

## first prepare your machine with run prepare.sh shell script

## replace your username in code that has uid and gid 1000. in my case username is main so you can search main entry in given file location and replace it with your user.

## username replace in "environments/localhost/group_vars/all/default.yml" &  "environments/localhost/hosts" , replace ip in hosts file also.

## then run " ./run.sh elastic " commnad to install elasticsearch using ansible

## make sure scripts has execute permission. and also make sure your user must have sudo privilages and docker privilages also to run it.

## go to this location of laptop /home/main/baha_june_2023/tass-projects-bsk-Adding-componentes-to-deployment and copy required playbooks and roles directory in code structure, then you will able to deploy more components using jenkins.
