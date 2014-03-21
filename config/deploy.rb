require 'bundler/capistrano'
require 'rvm/capistrano'

set :application, "nutty"
set :repository,  "https://github.com/jnobledesktop/nutty.git"

set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :rails_env, :production
set :rvm_type, :user

set :use_sudo, false
set :normalize_asset_timestamps, false
set :deploy_via, :remote_cache

set :domain, "www.thatnuttyguy.com"
set :user, "jorge"
set :deploy_to, "/home/jorge/nutty"

role :web, domain                          # Your HTTP server, Apache/etc
role :app, domain                          # This may be the same as your `Web` server
role :db,  domain, :primary => true # This is where Rails migrations will run

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
 namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end

 task :seed do
 	deploy.migrations
 	run "cd #{current_path}; rake db:seed RAILS_ENV=production"
 end
end
