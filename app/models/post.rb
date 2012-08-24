class Post < ActiveRecord::Base
  attr_accessible :body, :title
  validates_presence_of :title, :body
  validates_uniqueness_of :title
  has_many :comments, :dependent => :destroy
end

