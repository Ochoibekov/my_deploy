# Load DSL and set up stages
require "./lib/config_project"
@config_project = ConfigProject.new(ENV['PROJECT'])

# require 'sshkit/sudo'
require "capistrano/setup"
require "capistrano/deploy"
require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

# require 'sshkit/sudo'
require "capistrano/setup"
require "capistrano/deploy"
require 'capistrano/rvm'
require 'capistrano/bundler'
require 'capistrano/rails/migrations' if @config_project.migrations?
require 'capistrano/rails/assets' if @config_project.assets?
require 'capistrano/console'
require 'capistrano/logtail'
require 'capistrano/rails/collection'
require 'capistrano/foreman'
require 'capistrano/rails/console'
require 'airbrussh/capistrano'


# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
