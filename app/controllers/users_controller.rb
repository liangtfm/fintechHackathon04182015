class UsersController < ApplicationController

  def index
    @user = User.new # current_user
  end

  def brand
    @user = User.find(params[:id])
    #render json: { brands: user.brand_affinity }
    render json: { results: User.brand }
  end

	def show
    @user = User.find(params[:id])
  end
end
