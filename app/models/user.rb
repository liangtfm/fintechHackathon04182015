require "#{Rails.root}/lib/analyze"
require "#{Rails.root}/lib/keywords"

class User
  include MongoMapper::Document
  key :name, String
  key :nickname, String
  key :provider, String
  key :uid, String
  key :last_login, Time

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
      { content_match: taxonomy.slice(0,5), brands: brands.slice(0,4) }
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

	def get_tweets
		tweet_array = @@client.user_timeline(self.nickname, {count: 50})
    tweet_array.each do |tweet|
      Tweet.add(tweet.text, tweet.id, self.id)
    end
	end

  def self.create_with_omniauth(auth)
    user = User.new
    user.provider = auth['provider']
    user.uid = auth['uid']
    if auth['info']
      user.name = auth['info']['name'] || ""
      user.nickname = auth['info']['nickname'] || ""
    end
    user.last_login = Time.now
    user.save!
    user.get_tweets
    user
  end

  def self.update_last_login(id)
    user = User.find(id)
    if (Time.now.utc - user.last_login) >= 7200
      user.get_tweets
    end
    user.last_login = Time.now
    user.save
  end

  def user_params
    params.require(:user).permit(:name)
  end

end
