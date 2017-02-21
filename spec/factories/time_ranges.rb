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
    start_time do
      today = Time.zone.today
      Time.zone.local(today.year, today.month, today.day, 8, 30)
    end
    end_time do
      today = Time.zone.today
      Time.zone.local(today.year, today.month, today.day, 21, 0)
    end
  end
end
