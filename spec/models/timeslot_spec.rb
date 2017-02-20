# == Schema Information
#
# Table name: timeslots
#
#  id              :integer          not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  mc_only         :boolean          not null
#  day             :integer          not null
#  default_user_id :integer          not null
#  time_range_id   :integer          not null
#  place_id        :integer          not null
#
# Indexes
#
#  index_timeslots_on_default_user_id  (default_user_id)
#  index_timeslots_on_place_id         (place_id)
#  index_timeslots_on_time_range_id    (time_range_id)
#

require 'rails_helper'

RSpec.describe Timeslot, type: :model do
  it 'successfully saves if no column is null' do
    timeslot = build(:timeslot)
    expect(timeslot.save).to be true
  end

  it 'does not save if mc_only is null' do
    timeslot = build(:timeslot, mc_only: nil)
    expect(timeslot.save).to be false
  end

  it 'does not save if day is null' do
    timeslot = build(:timeslot, day: nil)
    expect(timeslot.save).to be false
  end

  it 'does not save if default_user_id is null' do
    timeslot = build(:timeslot, default_user_id: nil)
    expect(timeslot.save).to be false
  end

  it 'does not save if time_range_id is null' do
    timeslot = build(:timeslot, time_range: nil)
    expect(timeslot.save).to be false
  end

  it 'does not save if place_id is null' do
    timeslot = build(:timeslot, place_id: nil)
    expect(timeslot.save).to be false
  end

  it 'has many duties' do
    expect(Timeslot.reflect_on_association(:duties).macro).to be :has_many
  end

  it 'belongs to place' do
    expect(Timeslot.reflect_on_association(:place).macro).to be :belongs_to
  end

  it 'belongs to time range' do
    expect(Timeslot.reflect_on_association(:time_range).macro).to be :belongs_to
  end

  it 'belongs to default_user' do
    expect(Timeslot.reflect_on_association(:default_user).macro)
      .to(be(:belongs_to))
  end
end
