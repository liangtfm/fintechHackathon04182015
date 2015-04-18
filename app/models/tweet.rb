class Tweet
  include MongoMapper::Document

  key :content, String
  key :user_id, Integer

  belongs_to :user
end
