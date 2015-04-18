class UsersController < ApplicationController

  def index
    @user = User.new # current_user
  end

  def analyze
    @user = User.find(params[:id])
    render json: { analysis: @user.analyze }
    #render json: { results: User.brand }
  end

	def show
    @user = User.find(params[:id])
    if current_user && current_user.id == @user.id
      @tweets = @user.get_tweets(@user.id)
    else
      redirect_to root_url
    end
  end
end
