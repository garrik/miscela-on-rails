class Subscription < ActiveRecord::Base
  #attr_accessible :band_members, :band_name, :city, :email, :event, :genre, :name, :notes, :userid, :video_link, :website, :website2
  attr_accessible :band_members, :band_name, :city, :genre, :notes, :video_link, :website, :website2, :photo

  validates :band_members, presence: true
  validates :band_name, presence: true
  validates :city, presence: true
  validates :event, presence: true
  validates :genre, presence: true
  validates :name, presence: true
  validates :userid, presence: true
  validates :video_link, presence: true
  validates :website, presence: true
  validates :website2, presence: true

  has_attached_file :photo
end
