class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def user_est_admin?
    return false unless user_signed_in?
    current_user.admin
  end
  
  def adminseulement
    (redirect_to root_url) unless user_est_admin?
  end
end
