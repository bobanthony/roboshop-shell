
source common.sh
print_head "set up mongodb repos"
cp configs/mongodb.repo /etc/yum.repos.d/mongodb.repo
print_head "installing mongodb"
yum install mongodb-org -y
print_head "enabling mongodb"
systemctl enable mongod
print_head "starting mongodb"
systemctl start mongod
# update listen address from 127.0.0.1 to 0.0.0.0 in /etc/mongod.conf