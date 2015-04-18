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
  end
end
