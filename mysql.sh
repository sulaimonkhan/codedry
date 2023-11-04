echo -e "\e[34m Disable MySQL Default Version \e[0m"
yum  module disable mysql -y &>>/tmp/roboshop.log

echo -e "\e[34m Copy MySQL Repo File \e[0m"
cp /home/centos/rbs-shell/mysql.repo /etc/yum.repos.d/mysql.repo &>>/tmp/roboshop.log

echo -e "\e[34m Install MySQL Community Server \e[0m"
yum install mysql-community-server -y &>>/tmp/roboshop.log

echo -e "\e[34m Start MySQL Service\e[0m"
systemctl enable mysqld &>>/tmp/roboshop.log
systemctl restart mysqld &>>/tmp/roboshop.log

echo -e "\e[34m Setup MySQL Password \e[0m"
mysql_secure_installation --set-root-pass $1 &>>/tmp/roboshop.log