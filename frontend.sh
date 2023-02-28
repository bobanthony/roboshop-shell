source common.sh


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
cd /usr/share/nginx/html
unzip /tmp/frontend.zip  &>>${log_file}
print_head "copying nginx configs"
cp ${code_dir}/configs/nginx.roboshop.configs /etc/nginx/default.d/roboshop.conf &>>${log_file}
print_head "restarting nginx"
systemctl restart nginx  &>>${log_file}