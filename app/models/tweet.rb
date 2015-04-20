class Tweet
  include MongoMapper::Document

  key :content, String
  key :user_id, String
  key :twitter_id, Integer

  belongs_to :user

  def self.add(text, id, user_id)
    puts Tweet.find(twitter_id: id).inspect
    if !Tweet.find(twitter_id: id) && !Tweet.find(content: text)
      Tweet.create(content: text, twitter_id: id, user_id: user_id)
    end
  end
end
