class User < ActiveRecord::Base
  has_secure_password
  validates :password, length: { minimum: 6, maximum: 20 }, on: :create # on: :create because :password is not an actual attribute. When updating, you will not be sending any :password, but the validation will run anyway, and cause any update to fail
end
