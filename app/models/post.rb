class Post < ActiveRecord::Base
  belongs_to :blogger
  has_many:comments
  validates_presence_of :title
  validates_presence_of :body
end
