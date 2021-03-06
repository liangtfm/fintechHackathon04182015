class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :signed_in?

  private

	def current_user
	 return nil unless session[:user_id]
	 @current_user ||= User.find(session[:user_id])
	end

	def signed_in?
	 !!current_user
	end
end
