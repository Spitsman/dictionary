class ApplicationController < ActionController::Base

  helper_method :current_user, :current_user_session, :articles_collection 

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

	def current_user 
	 return @current_user if defined?(@current_user)
	 @current_user = current_user_session && current_user_session.user
  end

	def require_user 
  	redirect_to '/login' unless current_user 
	end

  def require_no_user
    redirect_to root_path if current_user
  end

  def articles_collection
    return @articles_collection if defined?(@articles_collection)
    @articles_collection = dictionary.lookup(params[:lang], params[:text])
  end

  def dictionary
    @dictionary ||= DictionaryAPI::DictionaryAPI.new('dict.1.1.20150814T100205Z.a0d27651d642b1d1.93ce6ba9cd891aada1fb98d47b6cd89c15a32f2e')
  end

end
