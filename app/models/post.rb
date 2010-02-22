class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :blogger
  validates_presence_of :title
  validates_presence_of :body
  end
