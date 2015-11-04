class DictionaryController < ApplicationController

  before_action :require_user

  def index
    begin
      @langs_collection = dictionary.get_langs
      @last = current_user.requests.last(10)
    rescue Exception => error
      render :text => error.message
    end
  end

  def lookup
    begin
      current_user.requests.create(build_request)
                
    rescue Exception => error
      render :text => error.message
    end   
  end

  protected

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
