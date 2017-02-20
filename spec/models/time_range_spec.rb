# == Schema Information
#
# Table name: time_ranges
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  start      :datetime         not null
#  end        :datetime         not null
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
end
