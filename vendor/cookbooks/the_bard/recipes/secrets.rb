#
# Cookbook Name:: the-bard
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

if node['secrets']

  template '/u/apps/craigslistpoetry-api_production/shared/config/secrets.yml' do
    owner 'deploy'
    group 'deploy'
    mode 0644
    source "secrets.yml.erb"
    variables secrets: node['secrets']
  end

end
