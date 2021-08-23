require 'resque'
require 'resque/tasks'

task "resque:setup" => :environment do
  CleanupJob.perform_later
end
