class CreateConfigHashtags < ActiveRecord::Migration[5.2]
  def change
    create_table :config_hashtags do |t|
      t.text :hashtag

      t.timestamps
      t.index :hashtag, unique: true
    end
  end
end
