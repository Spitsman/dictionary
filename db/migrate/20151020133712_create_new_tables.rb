class CreateNewTables < ActiveRecord::Migration
  def change
   create_table :users do |t|
    	t.string :username
    	t.string :crypted_password
      t.string :role
      t.string :email
      t.string :persistence_token
      t.string :password_salt
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

    create_table :translation_articles do |t|
      t.integer :article_id
      t.text :text
      t.text :position
      t.text :gender
      t.text :animated
      t.text :synonym
      t.text :meaning
      t.text :example
      t.text :aspect
    end
  end
end
