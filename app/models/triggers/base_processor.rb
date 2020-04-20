# abstract class
class BaseProcessor
  def initialize(tweet)
    @tweet = tweet
  end

  def process
    raise 'Must be implemented by child class'
  end

  def enqueue_task(task)
    TaskProcessor.instance.perform_async(task)
  end
end
