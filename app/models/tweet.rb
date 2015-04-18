class Tweet
  include MongoMapper::Document

  key :content, String
  key :user_id, String

  belongs_to :user
end
