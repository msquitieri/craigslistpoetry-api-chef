craigslistpoetry-api-chef
======================

Forked from [https://github.com/intercity/chef-repo](https://github.com/intercity/chef-repo). Special thanks to them!

These collection of chef recipes:

- install MySQL for databases
- set up the `craigslistpoetry-api` project with the proper directory structure for `capitstrano` deploys.
- Set's up cron jobs to email admin users an activity email, send out tweets, and perform daily backups.
- Includes configuration management for all sensitive API keys and passwords for various external services.

## Getting started

The following paragraphs will guide you to set up your own server to host Ruby on Rails applications.

### 1. Set up this repository

Clone the repository onto your own workstation. For example in your `~/Code` directory:

```sh
$ cd ~/Code
$ git clone git://github.com/msquitieri/craigslistpoetry-api-chef.git
```

Run bundle:

```sh
$ bundle install
```

Run Librarian install:

```sh
$ librarian-chef install
```

### 2. Install your server

Edit the `nodes/api.json` file and set up all of the configuration of database passwords, etc. When that is done, just run:

```sh
knife solo bootstrap USER@HOST_IP nodes/api.json
```

This will install chef on your server and run it for the first time.

If you want to just do a chef run on the server, run:


```sh
knife solo cook USER@HOST_IP nodes/api.json
```

### 3. Deploy your application

Change the host IP in the config/deploy/production.rb, and run `bundle exec cap production deploy`


**That's it!** The application should have been deployed.


## Related Repos

Please see related repos to this project:
- [craigslistpoetry-frontend](https://github.com/msquitieri/craigslistpoetry-frontend) repo, which is written in [Ember](https://github.com/emberjs/ember.js)
- [craigslistpoetry-api](https://github.com/msquitieri/craigslistpoetry-api) repo, a Ruby on Rails application to retreive poems and their data.
