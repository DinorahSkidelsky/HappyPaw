class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :profile, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :chatrooms
  has_many :messages, dependent: :destroy
  validates :first_name, :last_name, presence: true
  has_one_attached :photo
end
