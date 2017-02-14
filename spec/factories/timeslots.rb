# == Schema Information
#
# Table name: timeslots
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  mc_only       :boolean          not null
#  day           :integer          not null
#  user_id       :integer          not null
#  time_range_id :integer          not null
#  place_id      :integer          not null
#
# Indexes
#
#  index_timeslots_on_place_id       (place_id)
#  index_timeslots_on_time_range_id  (time_range_id)
#  index_timeslots_on_user_id        (user_id)
#

FactoryGirl.define do
  factory :timeslot do
  end
end
