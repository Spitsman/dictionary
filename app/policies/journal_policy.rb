class JournalPolicy

	attr_reader :current_user, :required_user

  def initialize(current_user, required_user)
    @current_user = current_user
    @required_user = required_user
  end

	def index_or_destroy?
		@current_user.admin? || @current_user.id == @required_user.to_i # shit
	end

end