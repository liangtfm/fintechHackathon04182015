class UsersController < ApplicationController

  def analyze
    @user = current_user
    @analysis = @user.analyze(@user.id)

    @estimates = Hash.new { |hash, key| hash[key] = {} }

    @analysis[:brands].each do |brand|
      @estimates[brand] = JSON.parse(RestClient.get 'http://api.estimize.com/companies/'+ brand.last[:ticker] +'/releases/2016.json', {'X-Estimize-Key' => '38704631c5b84c02a4bb900e'})
    end

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
    if current_user
      @user = current_user
      render json: @user.get_tweets
    else
      redirect_to root_url
    end
  end
end
