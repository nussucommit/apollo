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
end
