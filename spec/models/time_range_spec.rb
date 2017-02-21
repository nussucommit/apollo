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

require 'rails_helper'

RSpec.describe TimeRange, type: :model do
  it 'successfully saves if no column is null' do
    time_range = build(:time_range)
    expect(time_range.save).to be true
  end

  it 'does not save if start column is null' do
    time_range = build(:time_range, start: nil)
    expect(time_range.save).to be false
  end

  it 'does not save if end column is null' do
    time_range = build(:time_range, end: nil)
    expect(time_range.save).to be false
  end

  it 'has many timeslots' do
    expect(TimeRange.reflect_on_association(:timeslots).macro).to be :has_many
  end

  it 'has start with multiple of 30 minutes' do
    time_range = build(:time_range, start: '09:09'.to_time)
    expect(time_range.save).to be false
  end

#  it 'has end with multiple of 30 minutes' do
#   time_range = build(:time_range, add_attribute(:end): '17:17'.to_time)
#   expect(time_range.save).to be false
# end
end
