# config valid only for current version of Capistrano
lock '3.4.0'

set :application, ''
set :repo_url, ''

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
ask :branch, 'master'

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'
set :deploy_to, ''

# Default value for :scm is :git
# set :scm, :git
set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')
set :linked_files, fetch(:linked_files, []).push('.env')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push(
#  'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system'
# )
set :linked_dirs, fetch(:linked_dirs, []).push(
  'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system'
)

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }
set :default_env, ({
  rbenv_root: '/usr/local/rbenv',
  path: '/usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH'
})

# Default value for keep_releases is 5
# set :keep_releases, 5
set :keep_releases, 5

# namespace :deploy do
#   after :restart, :clear_cache do
#     on roles(:web), in: :groups, limit: 3, wait: 10 do
#       # Here we can do anything such as:
#       # within release_path do
#       #   execute :rake, 'cache:clear'
#       # end
#     end
#   end
# end

# Unicornの設定
set :unicorn_rack_env,    'none'
set :unicorn_config_path, 'config/unicorn.rb'

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  # サーバーの再起動タスク
  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
  end

  # 設定ファイルのアップロードタスク
  desc 'Upload configuration file'
  task :upload do
    on roles(:app) do
      if test "[ ! -d #{shared_path}/config ]"
        execute "mkdir -p #{shared_path}/config"
      end
      upload!('config/database.yml',  "#{shared_path}/config/database.yml")
      upload!('config/secrets.yml',   "#{shared_path}/config/secrets.yml")
      upload!('.env',                 "#{shared_path}/.env")
    end
  end

  before :starting, 'deploy:upload'
  after :finishing, 'deploy:cleanup'
end
