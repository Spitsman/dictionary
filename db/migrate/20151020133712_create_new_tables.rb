class CreateNewTables < ActiveRecord::Migration
  def change
   create_table :users do |t|
    	t.string :username
    	t.string :password_digest
      t.timestamps null: false
    end

  	create_table :requests do |t|
  		t.integer :user_id
    	t.text :lang
    	t.text :text
      t.timestamps null: false
    end

    create_table :articles do |t|
    	t.integer :request_id
    	t.text :text
    	t.text :position
    	t.text :transcription
      t.timestamps null: false
    end
  end
end
