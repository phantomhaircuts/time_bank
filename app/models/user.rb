class User < ActiveRecord::Base
  # it's a good idea to keep related code together, and separated by new lines
  # for example, all the validations together, all the relationships (has_many,
  # etc) together.
  validates :username, presence: true, uniqueness: true
  has_one :profile
  has_secure_password
  validates_uniqueness_of :username
end
