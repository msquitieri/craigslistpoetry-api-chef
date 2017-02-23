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
  # 10PM EST / 11PM DST
  hour '3'
  weekday '*'
  user 'deploy'
  command 'cd /u/apps/craigslistpoetry-api_production/current && RAILS_ENV=production /opt/rbenv/shims/bundle exec rake admin:activity_notification >> /u/apps/craigslistpoetry-api_production/shared/log/notification.log 2>&1'
end

# Import Posts every hour on the hour.
cron 'import posts' do
  action :create
  minute '0'
  hour '*'
  weekday '*'
  user 'deploy'
  command 'cd /u/apps/craigslistpoetry-api_production/current && RAILS_ENV=production /opt/rbenv/shims/bundle exec rake import:posts >> /u/apps/craigslistpoetry-api_production/shared/log/import-posts.log 2>&1'
end

# Import lines every hour on the half hour.
cron 'import lines' do
  action :create
  minute '30'
  hour '*'
  weekday '*'
  user 'deploy'
  command 'cd /u/apps/craigslistpoetry-api_production/current && RAILS_ENV=production /opt/rbenv/shims/bundle exec rake import:lines >> /u/apps/craigslistpoetry-api_production/shared/log/import-lines.log 2>&1'
end