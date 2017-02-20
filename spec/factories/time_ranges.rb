# == Schema Information
#
# Table name: time_ranges
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  start      :datetime
#  end        :datetime
#

FactoryGirl.define do
  factory :time_range do
  end
end
