class Identity < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :uid, :provider, :user_id
  validates_uniqueness_of :uid, :scope => :provider

  def self.find_for_oauth(auth)
  	find_or_create_by(uid: auth.id, provider: auth.provider)
  end
end
