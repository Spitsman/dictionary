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
      Request.create(lang: params[:lang],text: params[:text].gsub("%20", " "))
    end   
  end

  def journal
    @requests = Request.all
  end

  def destroy
    Request.destroy_all
    redirect_to action: "index"
  end

  protected

  def last_requests
    size = Request.all.size
    last = []
    if size < 10
      last = Request.all
    else
      for i in size - 10 ... size
        last << Request.all[i]
      end
    end
    last
  end

  def dictionary
    @dictionary ||= DictionaryAPI::DictionaryAPI.new('dict.1.1.20150814T100205Z.a0d27651d642b1d1.93ce6ba9cd891aada1fb98d47b6cd89c15a32f2e')
  end

end
