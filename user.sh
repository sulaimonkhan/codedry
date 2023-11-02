echo -e "\e[34mConfiguring NodeJS Repos\e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>/tmp/roboshop.log

echo -e "\e[34mInsatall NodeJS\e[0m"
yum install nodejs -y &>>/tmp/roboshop.log

echo -e "\e[34mAdd Application User\e[0m"
useradd roboshop &>>/tmp/roboshop.log

echo -e "\e[34mCreate Application Directory\e[0m"
rm -rf /app &>>/tmp/roboshop.log
mkdir /app

echo -e "\e[34mDownload Application Content\e[0m"
curl -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/user.zip &>>/tmp/roboshop.log
cd /app 

echo -e "\e[34mExtract Application Content\e[0m"
unzip /tmp/user.zip &>>/tmp/roboshop.log
cd /app

echo -e "\e[34mInstall NodeJS Dependiences\e[0m"
npm install &>>/tmp/roboshop.log

echo -e "\e[34mSetup SystemD Service\e[0m"
cp /home/centos/rbs-shell/user.service /etc/systemd/system/user.service &>>/tmp/roboshop.log

echo -e "\e[34mStart user Service\e[0m"
systemctl daemon-reload &>>/tmp/roboshop.log
systemctl enable user &>>/tmp/roboshop.log
systemctl restart user &>>/tmp/roboshop.log

echo -e "\e[34mCopy MongoDB Repo File\e[0m"
cp /home/centos/rbs-shell/mongodb.repo /etc/yum.repos.d/mongo.repo &>>/tmp/roboshop.log

echo -e "\e[34mInstall MongoDB Client\e[0m"
yum install mongodb-org-shell -y &>>/tmp/roboshop.log

echo -e "\e[34mLoad Schema\e[0m"
mongo --host mongodb-dev.devopsb72.site </app/schema/user.js &>>/tmp/roboshop.log