class User
  include MongoMapper::Document

  key :name, String
  key :twitter_uid, String

end
