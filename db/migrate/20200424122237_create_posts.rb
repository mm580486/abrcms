class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :title,default: ''
      t.text :content,default: ''
      t.text :excerpt
      t.string :status
      t.integer :comment_status
      t.string :password,:default => nil
      t.string :permalink,null: false
      t.string :post_type,null: false
      t.bigint :comment_count,:default =>  0

      t.timestamps
    end
  end
end
