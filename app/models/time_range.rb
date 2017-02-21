# == Schema Information
#
# Table name: time_ranges
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  start_time :time             not null
#  end_time   :time             not null
#

class TimeRange < ApplicationRecord
  has_many :timeslots
  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :start_is_multiple_of_thirty_minutes
  validate :end_is_multiple_of_thirty_minutes

  def start_is_multiple_of_thirty_minutes
    return if (start_time.to_i % 30.minutes).zero?
    errors.add :start_time, 'must be multiple of 30 minutes'
  end

  def end_is_multiple_of_thirty_minutes
    return if (end_time.to_i % 30.minutes).zero?
    errors.add :end_time, 'must be multiple of 30 minutes'
  end
end
