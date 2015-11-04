class TranslationArticle < ActiveRecord::Base
	#validates :article, presence: :true
	belongs_to :article
end