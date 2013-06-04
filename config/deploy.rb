require "bundler/capistrano"

load "config/recipes/base"
load "config/recipes/nginx"
load "config/recipes/unicorn"
load "config/recipes/mysql"
load "config/recipes/rbenv"
load "config/recipes/check"
load "config/recipes/nodejs"

server "74.208.90.50", :web, :app, :db, primary: true
set :domain, "underboutique.com"
set :user, "root"
set :application, "underboutique"
set :deploy_to, "/var/www/applications/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, "git"
set :repository, "git@github.com:nubis/underboutique.git"
set :branch, "master"
set :keep_releases, 2

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup" # keep only the last 5 releases
