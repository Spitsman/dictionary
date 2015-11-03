class SessionsController < ApplicationController

	before_action :require_no_user, only: [:new, :create]

	def new
		@user_session = UserSession.new
	end
	
	def create
		@user_session = UserSession.new(user_session_params)
		if @user_session.save
			redirect_to root_path
		else
			redirect_to login_path
		end
	end

	def destroy
		current_user_session.destroy
		redirect_to login_path
	end
	
	private

	def user_session_params
    params.require(:user_session).permit(:username, :password)
  end
end
