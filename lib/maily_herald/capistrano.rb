Capistrano::Configuration.instance.load do

	namespace :maily_herald do
		desc "Stop maily_herald"
		task :stop, :roles => :app do
			run "cd #{current_path}; bundle exec maily_herald_daemon.rb stop"
		end

		desc "Start maily_herald"
		task :start, :roles => :app do
			run "cd #{current_path}; RAILS_ENV=#{rails_env} bundle exec maily_herald_daemon.rb start" 
		end

		desc "Restart maily_herald"
		task :restart, :roles => :app do
			stop
			start
		end
	end
	after 'deploy', 'maily_herald:restart'
end
