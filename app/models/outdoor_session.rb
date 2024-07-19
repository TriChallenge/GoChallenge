class OutdoorSession < ApplicationRecord
  belongs_to :user
  validates :start_time, presence: true
  validates :end_time, presence: true, on: :update
  validate :end_time_after_start_time

  before_save :calculate_duration, if: -> { start_time.present? && end_time.present? }

  private

  def end_time_after_start_time
    if end_time.present? && start_time.present? && end_time <= start_time
      errors.add(:end_time, "must be after the start time")
    end
  end

  def calculate_duration
    self.duration = ((end_time - start_time) / 1.hour).round(2)
  end
end
