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
    start = build(:time_range)
    expect(start.save).to be true
  end
  it 'do not saves if start column is null' do
    start = build(:time_range, start: nil)
    expect(start.save).to be false
  end
  it 'do not saves if end column is null' do
    start = build(:time_range, end: nil)
    expect(start.save).to be false
  end
end
