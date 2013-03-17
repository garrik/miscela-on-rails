class Article < ActiveRecord::Base
  attr_accessible :author, :content, :createdate, :draft, :modifydate, :permalink, :title
  validates :title, :presence => true
  validates :content, :presence => true
end
