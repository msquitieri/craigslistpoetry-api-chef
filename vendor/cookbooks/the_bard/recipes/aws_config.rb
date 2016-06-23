#
# Cookbook Name:: the-bard
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

if node['aws_config']

  directory '/home/deploy/.aws' do
    user 'deploy'
    group 'deploy'
    action :create
  end

  template '/home/deploy/.aws/credentials' do
    owner 'deploy'
    group 'deploy'
    mode 0644
    source "aws_credentials.erb"
    variables credentials: node['aws_config']
    action :create
  end

  template '/home/deploy/.aws/config' do
    owner 'deploy'
    group 'deploy'
    mode 0644
    source "aws_config.erb"
    variables config: node['aws_config']
    action :create
  end

end
