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
    time_range = build(:time_range, start_time: nil)
    expect(time_range.save).to be false
  end

  it 'does not save if end column is null' do
    time_range = build(:time_range, end_time: nil)
    expect(time_range.save).to be false
  end

  it 'has many timeslots' do
    expect(TimeRange.reflect_on_association(:timeslots).macro).to be :has_many
  end

  it 'has start with multiple of 30 minutes' do
    today = Time.zone.today
    time_range = build(:time_range, start_time:
                 Time.zone.local(today.year, today.month, today.day, 9, 9))
    expect(time_range.save).to be false
  end

  it 'has end with multiple of 30 minutes' do
    today = Time.zone.today
    time_range = build(:time_range, end_time:
                 Time.zone.local(today.year, today.month, today.day, 17, 17))
    expect(time_range.save).to be false
  end
end
