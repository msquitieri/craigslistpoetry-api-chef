#
# Cookbook Name:: the-bard
# Recipe:: backup
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

if node['backup']

  directory '/tmp/backups/mysql' do
    group 'deploy'
    user 'deploy'
    recursive true
    action :create
  end

  directory '/home/deploy/scripts' do
    group 'deploy'
    user 'deploy'
    action :create
  end

  template '/home/deploy/scripts/backup_database.sh' do
    owner 'deploy'
    group 'deploy'
    mode 0744
    source "backup_database.sh.erb"
    variables s3_bucket: node['backup']['s3_bucket'], database_info: node['backup']['database_info']
    action :create
  end

  cron 'nightly backup' do
    action :create
    minute '0'
    # 2AM EST
    hour '6'
    weekday '*'
    user 'deploy'
    command '/home/deploy/scripts/backup_database.sh >> /home/deploy/scripts/backup.log 2>&1'
  end

  logrotate_app "craigslistpoetry-backups" do
    cookbook "logrotate"
    path ["/home/deploy/scripts/*.log"]
    frequency "daily"
    rotate 14
    compress true
    create "644 deploy deploy"
  end
end
