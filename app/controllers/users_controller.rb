class UsersController < ApplicationController

  def analyze
    @user = current_user
    @analysis = @user.analyze(@user.id)
    respond_to do |format|
      format.html
      format.json { render json: { analysis: @analysis } }
    end
  end

	def show
    @user = current_user
    @tweets = User.social_content(@user.id)
  end

  def tweets
    @user = User.find(params[:id])
    if current_user && current_user.id == @user.id
      render json: @user.get_tweets(@user.id)
    else
      redirect_to root_url
    end
  end
end
