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
  validates :start, presence: true
  validates :end, presence: true
  validate :start_is_multiple_of_thirty_minutes
  validate :end_is_multiple_of_thirty_minutes

  def start_is_multiple_of_thirty_minutes
    errors.add :start, 'must be multiple of 30 minutes' if (start.to_i % 30.minutes.to_i != 0)
  end

  def end_is_multiple_of_thirty_minutes
    errors.add :end, 'must be multiple of 30 minutes' if (__send__(:end).to_i % 30.minutes.to_i != 0)
  end
end
