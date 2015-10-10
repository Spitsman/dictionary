class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
    	t.text :lang
    	t.text :text
      t.timestamps null: false
    end
  end
end
