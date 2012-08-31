class Post < ActiveRecord::Base
  attr_accessible :body, :title, :tag_names
  validates_presence_of :title, :body
  validates_uniqueness_of :title
  has_many :comments, :dependent => :destroy
  has_many :taggings, :dependent => :destroy
  has_many :tags, :through => :taggings
  attr_writer :tag_names
  after_save :assign_tags
  
  def tag_names
    @tag_names || tags.map(&:name).join(' ')
  end
  
  private
  
  def assign_tags
    if @tag_names
      self.tags = @tag_names.split(/\,/).map do |name|
        Tag.find_or_create_by_name(name)
      end
    end
  end
end

