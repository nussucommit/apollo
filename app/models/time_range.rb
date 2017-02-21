# == Schema Information
#
# Table name: time_ranges
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  start      :time             not null
#  end        :time             not null
#

class TimeRange < ApplicationRecord
  has_many :timeslots
  validates :start, presence: true
  validates :end, presence: true
  validates :time_multiple_of_thirty_minutes

  def time_multiple_of_thirty_minutes
    if start % 30.minutes != 0 || add_attribute(:end) % 30.minutes != 0
    errors.add :start, 'must be multiple of 30 minutes'
    end
  end
end
