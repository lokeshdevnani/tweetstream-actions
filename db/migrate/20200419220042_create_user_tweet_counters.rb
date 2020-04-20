class CreateUserTweetCounters < ActiveRecord::Migration[5.2]
  def change
    create_table :user_tweet_counters do |t|
      t.string :username, null: false
      t.integer :tweet_count

      t.timestamps
      t.index :username, unique: true
    end
  end
end
