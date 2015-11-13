class SessionsController < ApplicationController

	before_action :require_no_user, only: [:new, :create]
	before_action :require_user, only: :destroy
	helper_method :resource_session

	def new
	end
	
	def create
		if resource_session.save
			redirect_to root_path
		else
			render :new
		end
	end

	def destroy
		current_user_session.destroy
		redirect_to login_path
	end
	
	private

  def resource_session
  	@resource_session ||= UserSession.new(params[:user_session])
  end
  
end
