class CreateActions < ActiveRecord::Migration[5.2]
  def change
    create_table :actions do |t|
      t.string :action_type
      t.json :config
      t.belongs_to :criterion

      t.timestamps
    end
  end
end
