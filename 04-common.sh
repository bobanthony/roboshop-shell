code_dir=$(pwd)
log_file=/tmp/roboshop.log
rm-f ${log_file} 2>/tmp/roboshop.log
print_head() (
echo -e "\e[36m$1\e[0m"
)