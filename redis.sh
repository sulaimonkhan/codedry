echo -e "\e[34mInstall Redis Repos \e[0m"
yum install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y &>>/tmp/roboshop.log


echo -e "\e[34mEnable Redis 6 Version \e[0m"
yum module enable redis:remi-6.2 -y  &>>/tmp/roboshop.log


echo -e "\e[34mInstall Redis \e[0m"
yum install redis -y &>>/tmp/roboshop.log


echo -e "\e[34mUpdate Redis Listen Address \e[0m"
sed -i 's/127.0.0.1/0.0.0.0./' /etc/redis.conf /etc/redis/redis.conf &>>/tmp/roboshop.log



echo -e "\e[34mStart Redis Service \e[0m"
systemctl enable redis &>>/tmp/roboshop.log
systemctl restart redis &>>/tmp/roboshop.log