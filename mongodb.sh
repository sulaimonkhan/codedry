echo -e "\e[34mCopy Mongodb Repo file\e[0m"
cp mongodb.repo /etc/yum.repos.d/mongodb.repo &>>/tmp/roboshop.log


echo -e "\e[34mInstalling MongoDB Server\e[0m"
yum  install mongodb-org -y &>>/tmp/roboshop.log

echo -e "\e[34mUpdate MongoDB Listen Address\e[0m"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf

echo -e "\e[34mStart MongoDB Service\e[0m"
systemctl enable mongod &>>/tmp/roboshop.log
systemctl restart mongod &>>/tmp/roboshop.log