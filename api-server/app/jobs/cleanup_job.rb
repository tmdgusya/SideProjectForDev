class CleanupJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "dododo"
  end
end
