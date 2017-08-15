#
# Cookbook Name:: the-bard
# Recipe:: lets_encrypt
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

if node['lets_encrypt']
  execute 'apt-get update' do
    command 'apt-get update'
  end

  execute 'apt-get install software-properties-common' do
    command 'apt-get install software-properties-common'
  end

  execute 'add-apt-repository ppa:certbot/certbot' do
    command 'add-apt-repository ppa:certbot/certbot'
  end

  execute 'apt-get update' do
    command 'apt-get update'
  end

  execute 'apt-get install python-certbot-nginx' do
    command 'apt-get install python-certbot-nginx'
  end

  cron 'certbot renew' do
    action :create
    minute '0'
    # 11PM EST
    hour '5'
    day '15'
    weekday '*'
    month '*'
    user 'root'
    command 'certbot renew >> /var/log/certbot.log'
  end

end
