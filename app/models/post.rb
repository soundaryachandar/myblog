class Post < ActiveRecord::Base
  has_many :comments
  has_one :blogger
  validates_presence_of :title
  validates_presence_of :body
  end
