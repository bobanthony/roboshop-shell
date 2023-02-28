
code_dir=$(pwd)
log_file=/tmp/roboshop.log
rm-f ${log_file} 2>/tmp/roboshop.log
print_head() (
echo -e "\e[36m$1\e[0m"
)
print_head "installing nginx"
yum install nginx -y &>>${log_file}
print_head "enable nginx"
systemctl enable nginx  &>>${log_file}
print_head "starting nginx"
systemctl start nginx  &>>${log_file}
print_head "removing contents frontend"
rm -rf /usr/share/nginx/html/*  &>>${log_file}
print_head "downloading and installing  frontend"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip  &>>${log_file}
print_head "extracting downloaded frontend"
cd /usr/share/nginx/html  &>>${log_file}
unzip /tmp/frontend.zip  &>>${log_file}
print_head "copying nginx configs"
cp ${code_dir}/configs/nginx.roboshop.configs /etc/nginx/default.d/roboshop.conf
print_head "restarting nginx"
systemctl restart nginx  &>>${log_file}