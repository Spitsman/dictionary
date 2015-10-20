class DictionaryController < ApplicationController

  before_action :require_user

  def index
    begin
      @langs = dictionary.get_langs
      @last = current_user.requests.last(10)
    rescue Exception => error
      render :text => error.message
    end
  end

  def lookup
    begin
      request = Request.create(lang: params[:lang], text: params[:text])
      articles_collection.map do |article|         
        art = Article.create(text: article.text, position: article.position, transcription: article.transcription)          
        article.translation.map do |tr_art|
          tr = TranslationArticle.new   
          tr.text = tr_art.text
          tr.position = tr_art.position
          tr.gender = tr_art.gender
          tr.animated = tr_art.animated
          tr.synonym = tr_art.synonym.to_s
          tr.meaning = tr_art.meaning.to_s
          tr.example = tr_art.example.to_s
          tr.aspect = tr_art.aspect
          tr.save
          art.translation_articles.push tr
        end
        request.articles.push art
      end
      current_user.requests.push request
    rescue Exception => error
      render :text => error.message
    end   
  end

  def articles_collection
    return @articles_collection if defined?(@articles_collection)
    @articles_collection = dictionary.lookup(params[:lang], params[:text])
  end

  protected

  def dictionary
    @dictionary ||= DictionaryAPI::DictionaryAPI.new('dict.1.1.20150814T100205Z.a0d27651d642b1d1.93ce6ba9cd891aada1fb98d47b6cd89c15a32f2e')
  end

end
