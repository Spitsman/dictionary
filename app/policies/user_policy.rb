class UserPolicy

	attr_reader :user

  def initialize(user)
    @user = user
  end

	def show?
		@user.admin?
	end
	
end