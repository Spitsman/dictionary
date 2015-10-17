class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :username
    	t.string :password_digest
      t.timestamps null: false
    end

    create_table :orders do |t|
      t.integer :user_id
      t.text :lang
    	t.text :text
      t.timestamps null: false
    end
  end
end
