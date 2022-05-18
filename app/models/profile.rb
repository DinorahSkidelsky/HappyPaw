class Profile < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_many :reviews, through: :reservations
  has_many :chatrooms, dependent: :destroy
  validates :description, :location, :price, :phone_number, presence: true
  has_many_attached :photos
end
