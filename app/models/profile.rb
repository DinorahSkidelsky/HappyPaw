class Profile < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_many :reviews, through: :reservations
  has_many :chatrooms, dependent: :destroy
  validates :description, :location, :price, :phone_number, :photos, presence: true
  validates :user_id, uniqueness: true
  has_many_attached :photos
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
