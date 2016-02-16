class User < ActiveRecord::Base
  has_secure_password
  has_many :ideas
  has_many :likes
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, :alias, presence: true, length: { minimum: 2 }
  validates :password, length: { minimum: 8 }, :on => :create
  validates :email, presence: true, uniqueness: {case_sensitive: false}, format: {with: EMAIL_REGEX}
  
end
