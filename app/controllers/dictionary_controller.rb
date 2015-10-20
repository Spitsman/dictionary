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
        request.articles.create(text: article.text, position: article.position, transcription: article.transcription)
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
