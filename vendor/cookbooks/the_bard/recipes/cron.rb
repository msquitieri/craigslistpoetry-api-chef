#
# Cookbook Name:: the-bard
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

cron 'admin activity email' do
  action :create
  minute '0'
  # 11PM EST
  hour '3'
  weekday '*'
  user 'deploy'
  command 'cd /u/apps/craigslistpoetry-api_production/current && RAILS_ENV=production /opt/rbenv/shims/bundle exec rake admin:activity_notification >> /u/apps/craigslistpoetry-api_production/shared/log/notification.log 2>&1'
end