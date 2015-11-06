class UsersController < ApplicationController

	before_action :require_no_user, only: [:create, :new]
	helper_method :resource_user, :users_collection

	def show
		authorize
		users_collection
	end

	def new
		resource_user
	end

	def profile
	end

	def create 
	  resource_user
	  if resource_user.save
	    redirect_to root_path
	  else 
	    render :new
	  end 
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
  	redirect_to root_path unless UserPolicy.new(current_user).show?
  end

end