class Boat < ApplicationRecord
  belongs_to :user
  has_many :bookings

  has_many_attached :photos

  validates :name, presence: true
  validates :price_per_day, presence: true
  validates :port, presence: true
end
