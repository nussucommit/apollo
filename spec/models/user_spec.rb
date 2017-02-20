# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  username      :string           not null
#  name          :string           not null
#  email         :string           not null
#  matric_number :string           not null
#  phone_number  :string           not null
#  cell          :string           not null
#  position      :string           not null
#
# Indexes
#
#  index_users_on_email          (email) UNIQUE
#  index_users_on_matric_number  (matric_number) UNIQUE
#  index_users_on_phone_number   (phone_number) UNIQUE
#  index_users_on_username       (username) UNIQUE
#

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'saves when nothing is nill' do
    user = build(:user)
    expect(user.save).to be true
  end
  it 'does not save when username is nill' do
    user = build(:user, username: nil)
    expect(user.save).to be false
  end
  it 'does not save when name is nill' do
    user = build(:user, name: nil)
    expect(user.save).to be false
  end
  it 'does not save when email is nill' do
    user = build(:user, email: nil)
    expect(user.save).to be false
  end
  it 'does not save when matric number is nill' do
    user = build(:user, matric_number: nil)
    expect(user.save).to be false
  end
  it 'does not save when phone number is nill' do
    user = build(:user, phone_number: nil)
    expect(user.save).to be false
  end
  it 'does not save when cell is nill' do
    user = build(:user, cell: nil)
    expect(user.save).to be false
  end
  it 'does not save when position is nill' do
    user = build(:user, position: nil)
    expect(user.save).to be false
  end
  it 'does not save when username is not unique' do
    create(:user, username: 'testing')
    user2 = build(:user, username: 'testing')

    expect(user2.save).to be false
  end
  it 'does not save when email is not unique' do
    create(:user, email: 'testing@gmail.com')
    user2 = build(:user, email: 'testing@gmail.com')

    expect(user2.save).to be false
  end
  it 'does not save when matric number is not unique' do
    create(:user, matric_number: 'testing')
    user2 = build(:user, matric_number: 'testing')

    expect(user2.save).to be false
  end
  it 'does not save when phone number is not unique' do
    create(:user, phone_number: 'testing')
    user2 = build(:user, phone_number: 'testing')

    expect(user2.save).to be false
  end
end
