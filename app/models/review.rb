class Review < ApplicationRecord
  belongs_to :reservation
  validates :content, presence: true, length: { minimum: 10 }
  validates :rating, presence: true, numericality: { only_integer: true }, inclusion: { in: 0..5 }
end
