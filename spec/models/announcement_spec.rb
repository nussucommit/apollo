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

require 'rails_helper'

RSpec.describe Announcement, type: :model do
  it 'saves when nothing is null' do
    announcement = build(:announcement)
    expect(announcement.save).to be true
  end

  it 'does not save when title is null' do
    announcement = build(:announcement, title: nil)
    expect(announcement.save).to be false
  end

  it 'does not save when contents is null' do
    announcement = build(:announcement, contents: nil)
    expect(announcement.save).to be false
  end

  it 'does not save when date is null' do
    announcement = build(:announcement, date: nil)
    expect(announcement.save).to be false
  end
end
