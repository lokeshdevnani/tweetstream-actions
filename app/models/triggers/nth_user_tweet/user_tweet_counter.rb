class UserTweetCounter < ApplicationRecord
  def self.increment_for_user(username)
    self.where(username: username).first_or_create(tweet_count: 0)
    self.where(username: username).update_all("tweet_count = tweet_count + 1")
  end
end
