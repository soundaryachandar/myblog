class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  validates_presence_of :title
  validates_presence_of :body
  has_many :ratings  
  acts_as_taggable
  
  def add_tags_through_string(string)
    self.tag_list.add(string.split(',')) if string
  end

  end
