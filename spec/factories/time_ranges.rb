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

FactoryGirl.define do
  factory :time_range do
    start { Time.zone.now }
    add_attribute(:end) { Time.zone.now }
  end
end
