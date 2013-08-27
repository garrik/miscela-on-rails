class Subscription < ActiveRecord::Base
  include SubscriptionsHelper
  #attr_accessible :band_members_number, :band_name, :city, :email, :event, :genre, :name, :notes, :userid, :video_link, :website, :website2
  attr_accessible :band_members_number, :band_name, :city, :genre, :notes, :video_link, :website, :website2, :song1, :song2, :photo, :attachment, :band_members_attributes

  has_attached_file :song1
  has_attached_file :song2
  has_attached_file :photo
  has_attached_file :attachment

  before_validation :smart_add_protocol_to_urls

  validates :band_members_number, presence: true
  validates :band_name, presence: true
  validates :city, presence: true
  validates :event, presence: true
  validates :genre, presence: true
  validates :name, presence: true
  validates :userid, presence: true
  #validates :video_link, presence: true
  validates :website, presence: true
  #validates :website2, presence: true
  validates :song1, presence: true
  validates :song2, presence: true
  validates :photo, presence: true
  validates :attachment, presence: true

  has_many :band_members, dependent: :destroy
  accepts_nested_attributes_for :band_members

  protected

  def smart_add_protocol_to_urls
    self.website = smart_add_url_protocol(self.website) unless self.website.empty?
    self.website2 = smart_add_url_protocol(self.website2) unless self.website2.empty?
    self.video_link = smart_add_url_protocol(self.video_link) unless self.video_link.empty?
  end
end