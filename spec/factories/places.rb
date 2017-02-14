# == Schema Information
#
# Table name: places
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string           not null
#
# Indexes
#
#  index_places_on_name  (name) UNIQUE
#

FactoryGirl.define do
  factory :place do
  end
end
