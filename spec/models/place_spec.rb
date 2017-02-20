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

require 'rails_helper'

RSpec.describe Place, type: :model do
  it 'saves when name is not null' do
    place = build(:place)
    expect(place.save).to be true
  end

  it 'does not save when name is null' do
    place = build(:place, name: nil)
    expect(place.save).to be false
  end

  it 'does not save when name is not unique' do
    create(:place, name: 'testing')
    place = build(:place, name: 'testing')
    expect(place.save).to be false
  end
end
