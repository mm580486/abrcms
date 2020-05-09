class CreateUsers < ActiveRecord::Migration[6.0]
  def up
    create_table :users do |t|
      t.string :login,null: false
      t.string :password_digest
      t.string :nicname
      t.string :email,null: false
      t.string :url
      t.string :activation_key
      t.string :display_name
      t.timestamps
    end
  end

  def down 
    drop_table :users
  end
end
