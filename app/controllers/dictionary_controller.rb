class DictionaryController < ApplicationController

  before_action :require_user
  helper_method :articles_collection, :langs_collection, :last_collection

  def index
  rescue Exception => error
    render :text => error.message
  end

  def lookup
    current_user.requests.create(build_request)                
  rescue Exception => error
    render :text => error.message
  end

  protected

  def last_collection
    @last_collection ||= current_user.requests.last(10)
  end

  def langs_collection
    @langs_collection ||= dictionary.get_langs
  end

  def articles_collection
    return @articles_collection if defined?(@articles_collection)
    @articles_collection = dictionary.lookup(params[:lang], params[:text])
  end

  def dictionary
    @dictionary ||= DictionaryAPI::DictionaryAPI.new('dict.1.1.20150814T100205Z.a0d27651d642b1d1.93ce6ba9cd891aada1fb98d47b6cd89c15a32f2e')
  end

  def build_request
    {lang: params[:lang], text: params[:text], articles: build_articles_collection}
  end

  def build_articles_collection
    articles_array = Array.new
    articles_collection.map do |article|         
      new_article = Article.create(article.attributes)          
      article.translation.map do |translation_article|
        new_article.translation_articles.create(translation_article.attributes)
      end
      articles_array.push new_article
    end
    articles_array
  end   

end
