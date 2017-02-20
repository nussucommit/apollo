# == Schema Information
#
# Table name: timeslots
#
#  id              :integer          not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  mc_only         :boolean          not null
#  day             :integer          not null
#  default_user_id :integer          not null
#  time_range_id   :integer          not null
#  place_id        :integer          not null
#
# Indexes
#
#  index_timeslots_on_default_user_id  (default_user_id)
#  index_timeslots_on_place_id         (place_id)
#  index_timeslots_on_time_range_id    (time_range_id)
#

class Timeslot < ApplicationRecord
  has_many :duties
  belongs_to :place
  belongs_to :time_range
  belongs_to :default_user, class_name: User
  enum day: Date::DAYNAMES
  validates :mc_only, :day, presence: true
end
