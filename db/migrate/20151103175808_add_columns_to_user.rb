class AddColumnsToUser < ActiveRecord::Migration
  def change
  	add_column :users, :email, :string
  	add_column :users, :persistence_token, :string
  	add_column :users, :password_salt, :string
  	add_index :users, :username, unique: true
  end
end
