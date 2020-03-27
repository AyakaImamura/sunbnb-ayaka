class Room < ApplicationRecord
  belongs_to :user
  has_many :photos
  has_many :reservations
  has_many :guest_reviews

  validates :home_type, presence: true
  validates :room_type, presence: true
  validates :guest_count, presence: true
  validates :bedrooms_count, presence: true
  validates :bathrooms_count, presence: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def average_rating
    guest_reviews.count == 0 ? 0 :guest_reviews.avarage(:star).round(2).to_i
  end
end
