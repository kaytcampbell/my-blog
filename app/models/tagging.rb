class Tagging < ActiveRecord::Base
  attr_accessible :post_id, :tag_id
  belongs_to :post 
  belongs_to :tag
end
