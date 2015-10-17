class AddJournalColumnsToRequests < ActiveRecord::Migration
  def change
  	add_column :requests, :texts, :string
  	add_column :requests, :positions, :string
  	add_column :requests, :transcriptions, :string
  	add_column :requests, :translation_texts, :string
  end
end
