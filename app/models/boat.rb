class Boat < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  has_many_attached :photos

  validates :name, presence: true
  validates :price_per_day, presence: true
  validates :port, presence: true
  # geocoded_by :port
  # after_validation :geocode, if: :will_save_change_to_port?

  include PgSearch::Model
  pg_search_scope :search_by_name_port_and_category_and_description,
  against: [ :name, :port, :category, :description ], using: { tsearch: { prefix: true }}
end
