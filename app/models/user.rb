class User
  include MongoMapper::Document

  key :name, String
  key :provider, String
  key :uid, String

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
        user.name = auth['info']['name'] || ""
      end
    end
  end

  def user_params
    params.require(:user).permit(:name)
  end
end
