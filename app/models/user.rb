require "#{Rails.root}/lib/analyze"
require "#{Rails.root}/lib/keywords"

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

  def analyze(user_id)
    tweets = User.social_content(user_id)
    taxonomy = Analyze.taxonomy(tweets)

    if taxonomy.length > 0
      brands = Analyze.brand_affinity(taxonomy)
      taxonomy.sort_by! { |item| item['score'] }.reverse!
      { content_match: taxonomy, brands: brands }
    else
      { msg: 'Cannot fetch data at the moment.' }
    end
  end

  def self.social_content(user_id)
    tweets = []
    Tweet.where(user_id: user_id.to_s).each do |tweet|
      tweets.push(tweet.content)
    end
    return tweets
  end

	def get_tweets(user_id)
		tweet_array = @@client.user_timeline(self.nickname, {count: 50})
    tweet_array.each do |tweet|
      Tweet.create(content: tweet.text, user_id: user_id)
    end
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
