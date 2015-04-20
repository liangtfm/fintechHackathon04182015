class Tweet
  include MongoMapper::Document

  key :content, String
  key :user_id, String
  key :twitter_id, Integer

  belongs_to :user

  def self.add(text, id, user_id)
    if Tweet.where(twitter_id: id).length > 0 ||
      Tweet.where(content: text).length > 0
      #nothing
    else
      Tweet.create(content: text, twitter_id: id, user_id: user_id)
    end
  end
end
