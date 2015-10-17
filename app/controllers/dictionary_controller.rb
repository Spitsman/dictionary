class DictionaryController < ApplicationController

  before_action :require_user

  def index
    begin
      @langs = dictionary.get_langs
    rescue Exception => error
      render :text => error.message
    else
      @last = self.last_requests
    end
  end

  def lookup
    begin
      @articles = dictionary.lookup(params[:lang], params[:text])
    rescue Exception => error
      render :text => error.message
    else
      current_user.requests.create(extract_data.merge({lang: params[:lang], text: params[:text].gsub("%20", " ")}))
    end   
  end

  def journal
    @requests = current_user.requests.all
  end

  def destroy
    current_user.requests.destroy_all
    redirect_to action: "index"
  end

  protected

  def extract_data
    texts = @articles.inject("") { |result, element| result << element.text << ' ' }  
    positions = @articles.inject("") { |result, element| result << element.position << ' ' } 
    transcriptions = @articles.inject("") { |result, element| result << element.transcription << ' ' } 
    translation_texts = @articles.inject("") do |result, element| 
      result << element.translation.inject("") { |res, el| res << el.text << ', ' }
      result << '; ' 
    end
    {texts: texts, positions: positions, transcriptions: transcriptions, translation_texts: translation_texts}  
  end


  def last_requests
    size = current_user.requests.size
    last = []
    if size < 10
      last = current_user.requests
    else
      for i in size - 10 ... size
        last << current_user.requests[i]
      end
    end
    last
  end

  def dictionary
    @dictionary ||= DictionaryAPI::DictionaryAPI.new('dict.1.1.20150814T100205Z.a0d27651d642b1d1.93ce6ba9cd891aada1fb98d47b6cd89c15a32f2e')
  end

end
