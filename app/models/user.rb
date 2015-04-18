require "#{Rails.root}/lib/analyze"
require "#{Rails.root}/lib/keywords"

# INCLUDE: instance method, extend: class method
class User
  include MongoMapper::Document
  key :name, String
  key :nickname, String
  key :provider, String
  key :uid, String

  many :tweets

  @@client = Twitter::REST::Client.new do |config|
	  config.consumer_key        = ENV['TWITTER_KEY']
	  config.consumer_secret     = ENV['TWITTER_SECRET']
	  config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
	  config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
	end

  def initialize
  end

  def analyze
    text = "Looking forward to my 3rd #hackathon and 2nd one with @CoreyLeveen. Representing @GAGrads #fintech http://t.co/rmnbLz2QHa
Thank you @joyent. I just can't remember all the different Linux package managers. So many flavors https://t.co/5jkFdXmpNU #devlife
Coachella isn't really my thing but I love the #fashion side of it. The H&M collection is pretty sweet & smart http://t.co/Lk0vxiK4Lg
Living in a fifth-floor walkup is like getting a free elliptical machine - no gym membership needed #nyc #winning
Anticipating five great presentations at @NYVM #nyvmtff #video #meetup"
    #brands = self.brand_affinity(Keywords.brand, text)
    risk_level = Analyze.risk_affinity(Keywords.risk, text)
    puts Keywords.risk
    { risk_level: risk_level } #brands: brands,
  end

  def self.social_content(id)
    #User.find(id).mytweets
  end

	def get_tweets
		return @@client.user_timeline(self.nickname, {count: 100})
    # returns an array of Tweet objects. Tweet.text returns the message.
	end

  def self.create_with_omniauth(auth)
    user = User.new
    user.provider = auth['provider']
    user.uid = auth['uid']
    if auth['info']
      user.name = auth['info']['name'] || ""
      user.nickname = auth['info']['nickname'] || ""
    end
    user.save!
    user
  end

  def user_params
    params.require(:user).permit(:name)
  end

end
