class Chatroom < ApplicationRecord
  belongs_to :user
  belongs_to :profile
  has_many :messages, dependent: :destroy
  validates :name, presence: true
end
