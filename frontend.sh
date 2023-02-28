
code_dir=$(pwd)
log_file=/tmp/roboshop.log
rm-rf ${log_file}
echo -e "\e[36minstalling nginx\e[0m"
yum install nginx -y
echo -e "\e[36enable nginx\e[0m"
systemctl enable nginx
echo -e "\e[36mstarting nginx\e[0m"
systemctl start nginx
echo -e "\e[36mremoving contents frontend\e[0m"
rm -rf /usr/share/nginx/html/*
echo -e "\e[36mdownloading and installing  frontend\e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip
echo -e "\e[36mextracting downloaded frontend\e[0m"
cd /usr/share/nginx/html
unzip /tmp/frontend.zip
echo -e "\e[36mcopying nginx configs\e[0m"
cp ${code_dir}/configs/nginx.roboshop.configs /etc/nginx/default.d/roboshop.conf
echo -e "\e[36mrestarting nginx\e[0m"
systemctl restart nginx