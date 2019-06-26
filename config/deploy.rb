# config valid only for current version of Capistrano
lock "3.10.1"

server @config_project.server_ip, user: @config_project.server_user, roles: %w{app db web}
set :application, @config_project.application
set :repo_url, @config_project.repo_url
set :server_user, @config_project.server_user
set :deploy_to, "/opt/#{@config_project.application}"
set :rvm_ruby_version, '2.5.1'

append :linked_dirs, 'log', 'tmp', 'public'
append :linked_files, '.env', 'config/puma.rb', 'config/database.yml', 'config/secrets.yml'

set :foreman_use_sudo, true
set :foreman_init_system, 'systemd'
set :foreman_export_path, '/lib/systemd/system'
set :foreman_options, app: fetch(:application), user: fetch(:server_user), root: current_path, log: File.join(shared_path, 'log')
set :branch, @config_project.branch


namespace :deploy do
  task :restart do
    on roles(:app) do |host|
      f = "#{fetch :foreman_export_path}/#{fetch(:foreman_options)[:app]}.conf"
      invoke 'foreman:export' unless test("[ -f #{f} ]")
      invoke 'foreman:stop'
      invoke 'foreman:start'
    end
  end

  task :check_env do
    on roles(:all) do |host|
      f = "#{shared_path}/.env"
      if test("[ -f #{f} ]")
        info "#{f} already exists on #{host}!"
      else
        execute "echo 'RAILS_ENV=#{fetch :stage}' > #{f}"
        execute "echo 'PATH=/usr/local/rvm/wrappers/#{fetch(:rvm_ruby_version)}:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin' >> #{f}"
      end
    end
  end

  before 'check:linked_files', :check_env
  after :publishing, :restart
end