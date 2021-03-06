require 'json'

class SessionsController < ApplicationController
	def create
    auth = request.env["omniauth.auth"]
    user = User.where(
             :provider => auth['provider'],
             :uid => auth['uid']
           ).first || User.create_with_omniauth(auth)

    session[:user_id] = user.id
    User.update_last_login(user.id)
    redirect_to profile_path
  end

  def destroy
    reset_session
    redirect_to root_url
  end
end
