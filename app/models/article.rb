class Article < ActiveRecord::Base
  attr_accessible :author, :content, :createdate, :draft, :modifydate, :permalink, :title
end
