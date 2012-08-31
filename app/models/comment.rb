class Comment < ActiveRecord::Base
  attr_accessible :article_id, :body, :email, :name
  belongs_to :post
  validates_presence_of :name, :email, :body
end
