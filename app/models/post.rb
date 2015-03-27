class Post < ActiveRecord::Base
  validates :name, :presence => true
  validates :content, :presence => true
  has_many :comments
  belongs_to :user
end
