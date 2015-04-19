class UsersController < ApplicationController

  def index
    @user = User.new # current_user
  end

  def analyze
    @user = User.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: { analysis: @user.analyze(@user.id) } }
    end
  end

	def show
    @user = User.find(params[:id])
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
