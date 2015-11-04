class JournalController < ApplicationController

  before_action :require_user

  def index    
    @requests = User.includes(requests:[{articles: :translation_articles}]).find(current_user).requests.all
  end

  def destroy
    User.find(params[:id]).requests.destroy_all
    redirect_to root_path
  end

end
