class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  after_action :user_activity

  protected

  def user_activity
    current_user.try :touch
  end

end
