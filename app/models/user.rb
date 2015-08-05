class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  has_one :profile
  has_secure_password
  validates_uniqueness_of :username
end
