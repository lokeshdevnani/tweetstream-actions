class CreateConfigNthUserTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :config_nth_user_tweets do |t|
      t.string :username
      t.integer :interval

      t.timestamps
      t.index [:username, :interval], unique: true
    end
  end
end
