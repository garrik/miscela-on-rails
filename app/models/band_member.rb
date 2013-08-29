class BandMember < ActiveRecord::Base
  attr_accessible :email, :name, :phone, :rank, :surname

  validates :email, presence: true
  validates :name, presence: true
  validates :phone, presence: true
  validates :surname, presence: true

  belongs_to :subscription
end
