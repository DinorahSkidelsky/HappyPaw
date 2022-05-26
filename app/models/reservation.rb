class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :profile
  has_one :review, dependent: :destroy
  validates :start_time, :end_time, :phone_number, presence: true
  validate :date_cannot_be_in_the_past
  validate :start_time_cannot_be_end_time
  before_update :start_time_cannot_be_end_time

  def date_cannot_be_in_the_past
    if start_time.present? && start_time < Date.current
      errors.add(:start_time, "can't be in the past")
    end
    if end_time.present? && end_time < Date.current
      errors.add(:end_time, "can't be in the past")
    end
  end

  def start_time_cannot_be_end_time
    if start_time && end_time
      if start_time > end_time
        errors.add(:end_time, "can't be less than start time")
      end
    end
  end
end
