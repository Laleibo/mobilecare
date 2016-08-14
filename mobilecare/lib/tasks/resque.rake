require 'resque/tasks'
require 'resque/scheduler/tasks'

namespace :resque do
  desc "setup resque scheduler environment"
  task :setup, :environment do
    require 'resque'
    require 'resque-scheduler'
  end
end
