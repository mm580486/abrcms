class CreateSettings < ActiveRecord::Migration[6.0]
  def up
    create_table :settings do |t|
      t.string :key,null: false
      t.text :value

      t.timestamps
    end
  end

  def down
    drop_table :settings
  end
end
