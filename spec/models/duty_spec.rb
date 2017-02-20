# == Schema Information
#
# Table name: duties
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  date        :date             not null
#  timeslot_id :integer          not null
#  user_id     :integer
#
# Indexes
#
#  index_duties_on_timeslot_id  (timeslot_id)
#  index_duties_on_user_id      (user_id)
#

require 'rails_helper'

RSpec.describe Duty, type: :model do
  it 'saves when everything is fine' do
    duty = build(:duty)
    expect(duty.save).to be true
  end
  it 'does not save when date is null' do
    duty = build(:duty, date: nil)
    expect(duty.save).to be false
  end
  it 'does not save when timeslot_id is null' do
    duty = build(:duty, timeslot_id: nil)
    expect(duty.save).to be false
  end
  it 'saves when user_id is null' do
    duty = build(:duty, user_id: nil)
    expect(duty.save).to be true
  end
end
