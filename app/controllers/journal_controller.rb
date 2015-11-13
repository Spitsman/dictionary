class JournalController < ApplicationController

  before_action :require_user, :authorize
  helper_method :requests_collection

  def index     
  end

  def destroy
    User.find(required_user).requests.destroy_all
    redirect_to root_path 
  end

  private

  def requests_collection
    @requests_collection ||= User.includes(requests:[{articles: :translation_articles}]).
      find(required_user).requests.all
  end

  def required_user
  	@required_user ||= params[:required_user]
  end

  def authorize
  	redirect_to root_path unless journal_policy.index_or_destroy?
  end

  def journal_policy
    @journal_policy ||= JournalPolicy.new(current_user, required_user)
  end

end
