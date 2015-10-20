class JournalController < ApplicationController

  before_action :require_user

  def index
    @requests = current_user.requests.all
  end

  def destroy
    current_user.requests.destroy_all
    redirect_to action: "index"
  end
	
end
