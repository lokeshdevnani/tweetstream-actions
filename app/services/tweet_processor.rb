class TweetProcessor
  DEFAULT_TRIGGERS = [HashtagProcessor, NthUserTweetProcessor]

  def self.with_default_triggers
    instance = self.new
    DEFAULT_TRIGGERS.each {|trigger| instance.register_trigger(trigger) }
    return instance
  end

  def initialize
    @triggers = []
  end

  # @param trigger [BaseProcessor]
  def register_trigger(trigger)
    @triggers << trigger
  end

  # @param tweet [Tweet]
  def process_tweet(tweet)
    # fan out to all the triggers subscribed
    @triggers.each do |trigger|
      trigger.new(tweet).process
    end
    true
  end
end
