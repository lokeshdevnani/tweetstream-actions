class Task
  attr_reader :action, :tweet

  def self.for_type(action_type)
    if action_type == 'HTTP'
      return HTTPTask
    else
      raise 'Task not supported'
    end
  end

  def initialize(action: nil, tweet: nil, extra: {})
    @action = action
    @tweet = tweet
    @extra = extra
  end

  def execute
    raise 'Child class should override this'
  end
end
