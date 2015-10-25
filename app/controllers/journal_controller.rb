class JournalController < ApplicationController

  before_action :require_user

  def index
  	@requests = User.find(params[:id]).requests.all
  end

  def destroy
   	User.find(params[:id]).requests.destroy_all
    redirect_to action: "index"
  end
	
end
