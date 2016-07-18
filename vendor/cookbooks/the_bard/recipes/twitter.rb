#
# Cookbook Name:: the-bard
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

if node['twitter']

  template '/u/apps/craigslistpoetry-api_production/shared/config/twitter.yml' do
    owner 'deploy'
    group 'deploy'
    mode 0644
    source 'twitter.yml.erb'
    variables twitter: node['twitter']
  end

  cron 'send out tweet' do
    action :create
    minute '0'
    # Every two hours from 8am to midnight, inclusive.
    # 4 is midnight
    # 12 is 8am
    # 14 is 10am
    # 16 is 12pm
    # 18 is 2pm
    # 20 is 4pm
    # 22 is 6pm
    # 0 is 8pm
    # 2 is 10pm
    hour '0,2,4,12,14,16,18,20,22'
    weekday '*'
    user 'deploy'
    command 'cd /u/apps/craigslistpoetry-api_production/current && RAILS_ENV=production /opt/rbenv/shims/bundle exec rake social:tweet >> /u/apps/craigslistpoetry-api_production/shared/log/tweet.log 2>&1'
  end

end
