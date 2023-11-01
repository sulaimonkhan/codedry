source common.sh
component=cart

echo -e "${color} configuring Nodejs Repos ${nocolor}"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>$log_file

echo -e "${color} Install Nodejs ${nocolor}"
yum install nodejs -y &>>$log_file

echo -e "${color} Add Application User ${nocolor}"
useradd roboshop &>>$log_file

echo -e "${color} Create Application Directory ${nocolor}"
rm -rf ${app_path} &>>$log_file
mkdir ${app_path}

echo -e "${color} Download Application Content ${nocolor}"
curl -o /tmp/$component.zip https://roboshop-artifacts.s3.amazonaws.com/$component.zip &>>$log_file
cd ${app_path}

echo -e "${color} Extract Application Content ${nocolor}"
unzip /tmp/$component.zip &>>$log_file
cd ${app_path} 

echo -e "${color} Install Nodejs Dependencies ${nocolor}"
npm install &>>$log_file

echo -e "${color} Setup SystemD service ${nocolor}"
cp /home/centos/codedry/$component.service /etc/systemd/system/$component.service &>>$log_file

echo -e "${color} Start $Component Service ${nocolor}"
systemctl daemon-reload &>>$log_file
systemctl enable $component &>>$log_file
systemctl restart $component &>>$log_file