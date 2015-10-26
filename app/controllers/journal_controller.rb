class JournalController < ApplicationController

  before_action :require_user

  def index
    unless self.abuse_of_authority?
      @requests = User.find(params[:id]).requests.all
    else
      redirect_to '/'
    end
  end

  def destroy
    unless self.abuse_of_authority?
      User.find(params[:id]).requests.destroy_all
      redirect_to action: "index"
    else
      redirect_to '/'
    end
  end

  protected

  def abuse_of_authority?
    !current_user.admin? && User.find(params[:id]) != current_user
  end
  
end
