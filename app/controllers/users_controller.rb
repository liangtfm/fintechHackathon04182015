class UsersController < ApplicationController
  require 'rest-client'

  def analyze
    @user = current_user
    @analysis = @user.analyze(@user.id)

    @estimates = []
    
    # @analysis[:brands].each do |brand|
    #   @estimize = RestClient.get 'http://api.estimize.com/companies/'+ brand.last[:ticker] +'/releases/2016.json', {'X-Estimize-Key' => '38704631c5b84c02a4bb900e'}
    #   @estimates << @estimize
    # end

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
