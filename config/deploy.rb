# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'ccmonitor'
set :repo_url, 'git@github.com:ochiait/ccmonitor.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/var/www/rails/ccmonitor'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# シンボリックリンクをはるファイル。今回はdotenvのgemを使用
#set :linked_files, fetch(:linked_files, []).push('.env')

# Default value for linked_dirs is []
# シンボリックリンクをはるフォルダ。
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')


# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }
set :default_env, {
  rbenv_root: "/usr/local/rbenv",
  path: "/usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH"
}


# Default value for keep_releases is 5
set :keep_releases, 5

# rubyのバージョン
set :rbenv_ruby, '2.2.2'

# rbenvのインストール先の設定
set :rbenv_custom_path, '/usr/local/rbenv'

# Uniconeの設定
set :unicorn_rack_env, 'none'
set :unicorn_config_path, 'config/unicorn.conf.rb'

namespace :deploy do
  desc 'Restart application'
  task :restart do
    #invoke 'unicorn:restart'
    invoke 'unicorn:legacy_restart'
  end
  desc 'Create database'
  task :db_create do
    on roles(:db) do |host|
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:create'
        end
      end
    end
  end
  desc 'Run seed'
  task :seed do
    on roles(:app) do
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:seed'
        end
      end
    end
  end
  after :publishing, :restart
  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end
end
