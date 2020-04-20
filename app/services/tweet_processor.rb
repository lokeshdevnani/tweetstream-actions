class TweetProcessor
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
  end
end
