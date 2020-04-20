class NthUserTweetProcessor < BaseProcessor
  def process
    update_tweet_counter
    trigger_configs = ConfigNthUserTweet.where(username: @tweet.username)
    trigger_configs.each do |trigger_config|
      author_tweet_count = get_tweet_count
      if interval_match?(author_tweet_count, trigger_config)
        trigger_config.criterion.actions.each do |action|
          task = Task.for_type(action.action_type)
                     .new(action: action, tweet: @tweet,
                          extra: { username: @tweet.username,
                                   tweet_count: author_tweet_count })
          enqueue_task(task)
        end
      end
    end
  end

  def update_tweet_counter
    UserTweetCounter.increment_for_user(@tweet.username)
  end

  def get_tweet_count
    UserTweetCounter.find_by(username: @tweet.username)&.tweet_count || 0
  end

  def interval_match?(tweet_count, trigger_config)
    tweet_count % trigger_config.interval == 0
  end
end


