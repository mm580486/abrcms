class CreatePostmeta < ActiveRecord::Migration[6.0]
  def up
    create_table :postmeta do |t|
      t.belongs_to :post, null: false, foreign_key: true
      t.string :key,null: false
      t.text :value,default: ''

      t.timestamps
    end
  end

  def down 
    drop_table :postmeta
  end
end
