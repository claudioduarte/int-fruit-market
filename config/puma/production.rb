rails_env = "production"
environment rails_env

#test

app_dir = "/home/rails/int-fruit-market" # Update me with your root rails app path

bind  "unix://#{app_dir}/tmp/sockets/puma.sock"
pidfile "#{app_dir}/tmp/pids/puma.pid"
state_path "#{app_dir}/tmp/puma.state"
directory "#{app_dir}/"

stdout_redirect "#{app_dir}/log/puma.stdout.log", "#{app_dir}/log/puma.stderr.log", true

workers 1
threads 1,2

activate_control_app "unix://#{app_dir}/tmp/sockets/pumactl.sock"

prune_bundler
