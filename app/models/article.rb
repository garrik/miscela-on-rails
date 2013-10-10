class Article < ActiveRecord::Base
  attr_accessible :author, :content, :draft, :permalink, :title
  validates :author, :presence => true, :length => { :in => 0..255 }
  validates :title, :presence => true, :length => { :in => 0..255 }
  validates :content, :presence => true, :length => { :in => 0..1000 }
end
