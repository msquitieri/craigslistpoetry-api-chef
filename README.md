craigslistpoetry-api-chef
======================

Forked from [https://github.com/intercity/chef-repo](https://github.com/intercity/chef-repo). Special thanks to them!


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
