class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  validates_presence_of :title
  validates_presence_of :body
  has_many :ratings  
  acts_as_taggable
  acts_as_taggable_on :posttags
  end
