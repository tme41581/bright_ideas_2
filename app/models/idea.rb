class Idea < ActiveRecord::Base
  belongs_to :user
  has_many :likes
  validates :content, presence: true
end
