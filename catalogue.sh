source common.sh
component=catalogue

nodejs

echo -e "${color} Copy Mongodb Repo file ${nocolor}"
cp /home/centos/codedry/mongodb.repo /etc/yum.repos.d/mongo.repo &>>$log_file


echo -e "${color} Install MOngodb Client ${nocolor}"
yum install mongodb-org-shell -y &>>$log_file

echo -e "${color} Load Schema ${nocolor}"
mongo --host mongodb-dev.devopsb72.site </app/schema/$component.js &>>$log_file
