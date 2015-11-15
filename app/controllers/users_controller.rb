class UsersController < ApplicationController

	before_action :require_no_user, only: [:create, :new]
	before_action :authorize, only: [:show]
	helper_method :resource_user, :users_collection

	def show
	end

	def new
	end

	def profile
	end

	def create 
	  if resource_user.save
	    redirect_to root_path
	  else 
	    render :new
	  end 
	end

	def destroy
		User.find(params[:required_user]).destroy
		redirect_to root_path
	end

	private

	def users_collection
		@users_collection ||= User.all
	end

	def resource_user
		params.permit!
		@resource_user ||= User.new(params[:user])
	end

  def authorize
  	redirect_to root_path unless user_policy.show?
  end

  def user_policy
  	@user_policy ||= UserPolicy.new(current_user)
  end

end