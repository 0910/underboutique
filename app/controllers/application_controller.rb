class ApplicationController < ActionController::Base
  protect_from_forgery
  
  # Retrieves the shopping cart from the session
  def shopping_cart
    Cart.new session
  end
  helper_method :shopping_cart
  
  # For authorization, we use current_admin_user, not current_user
  def current_ability
    @current_ability ||= Ability.new(current_admin_user)
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
end
