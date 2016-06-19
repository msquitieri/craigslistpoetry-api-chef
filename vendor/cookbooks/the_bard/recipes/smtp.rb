#
# Cookbook Name:: the-bard
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

if node['smtp']

  template '/u/apps/craigslistpoetry-api_production/shared/config/smtp.yml' do
    owner 'deploy'
    group 'deploy'
    mode 0644
    source "smtp.yml.erb"
    variables smtp: node['smtp']
  end

end
