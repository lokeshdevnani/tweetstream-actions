class ConfigNthUserTweet < ApplicationRecord
  has_one :criterion, as: :trigger_config
end
