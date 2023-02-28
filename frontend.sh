
code_dir=$(pwd)
log_file=/tmp/roboshop.log
rm-f ${log_file}
echo -e "\e[36minstalling nginx\e[0m"
yum install nginx -y &>>${log_file}
echo -e "\e[36enable nginx\e[0m"
systemctl enable nginx  &>>${log_file}
echo -e "\e[36mstarting nginx\e[0m"
systemctl start nginx  &>>${log_file}
echo -e "\e[36mremoving contents frontend\e[0m"
rm -rf /usr/share/nginx/html/*  &>>${log_file}
echo -e "\e[36mdownloading and installing  frontend\e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip  &>>${log_file}
echo -e "\e[36mextracting downloaded frontend\e[0m"
cd /usr/share/nginx/html  &>>${log_file}
unzip /tmp/frontend.zip  &>>${log_file}
echo -e "\e[36mcopying nginx configs\e[0m"
cp ${code_dir}/configs/nginx.roboshop.configs /etc/nginx/default.d/roboshop.conf
echo -e "\e[36mrestarting nginx\e[0m"
systemctl restart nginx  &>>${log_file}