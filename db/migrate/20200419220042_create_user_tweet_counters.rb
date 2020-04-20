class CreateUserTweetCounters < ActiveRecord::Migration[5.2]
  def change
    create_table :user_tweet_counters do |t|
      t.string :username
      t.integer :tweet_count

      t.timestamps
    end
  end
end
