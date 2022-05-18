class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :profiles, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :messages, dependent: :destroy
  validates :first_name, :last_name, presence: true
end
