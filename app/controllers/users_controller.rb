class UsersController < ApplicationController

  def index
    @user = User.new # current_user
  end

  def brand
    #user = User.new
    #render json: { brands: user.brand_affinity }
    render json: { results: User.brand }
  end

end
