class CreateUsermeta < ActiveRecord::Migration[6.0]
  def up
    create_table :usermeta do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :key,null: false
      t.text :value,default: ''
      t.timestamps
    end
  end

  def down 
    drop_table :usermeta
  end
end
