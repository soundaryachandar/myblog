class Comment < ActiveRecord::Base
  belongs_to :posts
  validates_presence_of :name
  validates_presence_of :body
end
