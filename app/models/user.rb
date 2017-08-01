class User < ActiveRecord::Base
  has_many :lists

  validates :password_digest, presence: true
  validates :username,
            presence: true
end
