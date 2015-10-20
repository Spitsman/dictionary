class CreateTranslationArticle < ActiveRecord::Migration
  def change
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
