# == Schema Information
#
# Table name: announcements
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  contents   :text             not null
#  date       :datetime         not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :announcement do
    title "MyString"
    contents "MyText"
    date "2017-02-21 11:31:29"
  end
end
