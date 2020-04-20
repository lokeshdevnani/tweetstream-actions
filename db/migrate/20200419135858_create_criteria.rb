class CreateCriteria < ActiveRecord::Migration[5.2]
  def change
    create_table :criteria do |t|
      t.text :name
      t.references :trigger_config, polymorphic: true

      t.timestamps
    end
  end
end
