class UsersController < ApplicationController

	def new
  	@user = User.new
	end

	def create 
	  @user = User.new(user_params)
	  if @user.valid? && password_confirmed? && unique_user?
	  	@user.save
	    session[:user_id] = @user.id 
	    redirect_to '/index' 
	  else 
	    redirect_to '/signup' 
	  end 
	end

	private

	def user_params
    params.require(:user).permit(:username, :password)
  end

  def unique_user? 	
  	!User.exists?(username: params[:user][:username])
  end

  def password_confirmed?
  	params[:user][:password] == params[:user][:confirm_password]
  end

end