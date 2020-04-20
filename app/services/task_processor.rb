require 'singleton'

class TaskProcessor
  include Singleton

  def perform_async(task)
    # TODO: Use sidekiq/rescue for this
    task.execute
    # Thread.new { task.execute }
  end
end
