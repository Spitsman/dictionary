class UsersController < ApplicationController

	before_action :require_no_user, only: [:create, :new]

	def show
		authorize
		@users_collection = User.all
	end

	def new
  	@user = User.new
	end

	def profile
	end

	def create 
	  @user = User.new(user_params)
	  if @user.save
	    redirect_to root_path
	  else 
	    redirect_to signup_path 
	  end 
	end

	private

	def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :email)
  end

  def authorize
  	redirect_to root_path unless UserPolicy.new(current_user).show?
  end

end