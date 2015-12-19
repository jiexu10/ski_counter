class User < ActiveRecord::Base
  has_many :seasons

  validates :provider, presence: true
  validates :uid, presence: true
  validates :email, presence: true
  validates :name, presence: true

  def self.from_omniauth(auth)
    provider = auth.provider
    uid = auth.uid

    find_or_create_by(provider: provider, uid: uid) do |user|
      user.provider = provider
      user.uid = uid
      user.email = auth.info.email
      user.name = auth.info.name
      user.user_image = auth.info.image
    end
  end
end
