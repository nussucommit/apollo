# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  username               :string           not null
#  name                   :string           not null
#  email                  :string           default(""), not null
#  matric_number          :string           not null
#  phone_number           :string           not null
#  cell                   :string           not null
#  position               :string           not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_matric_number         (matric_number) UNIQUE
#  index_users_on_phone_number          (phone_number) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'saves when nothing is null' do
    user = build(:user)
    expect(user.save).to be true
  end

  it 'does not save when username is null' do
    user = build(:user, username: nil)
    expect(user.save).to be false
  end

  it 'does not save when name is null' do
    user = build(:user, name: nil)
    expect(user.save).to be false
  end

  it 'does not save when email is null' do
    user = build(:user, email: nil)
    expect(user.save).to be false
  end

  it 'does not save when matric number is null' do
    user = build(:user, matric_number: nil)
    expect(user.save).to be false
  end

  it 'does not save when phone number is null' do
    user = build(:user, phone_number: nil)
    expect(user.save).to be false
  end

  it 'does not save when cell is null' do
    user = build(:user, cell: nil)
    expect(user.save).to be false
  end

  it 'does not save when position is null' do
    user = build(:user, position: nil)
    expect(user.save).to be false
  end

  it 'does not save when username is not unique' do
    create(:user, username: 'testing')
    user = build(:user, username: 'testing')
    expect(user.save).to be false
  end

  it 'does not save when email is not unique' do
    create(:user, email: 'testing@gmail.com')
    user = build(:user, email: 'testing@gmail.com')
    expect(user.save).to be false
  end

  it 'does not save when matric number is not unique' do
    create(:user, matric_number: 'testing')
    user = build(:user, matric_number: 'testing')
    expect(user.save).to be false
  end

  it 'does not save when phone number is not unique' do
    create(:user, phone_number: 'testing')
    user = build(:user, phone_number: 'testing')
    expect(user.save).to be false
  end

  it 'has many duties' do
    expect(User.reflect_on_association(:duties).macro).to be :has_many
  end

  it 'has many timeslots' do
    expect(User.reflect_on_association(:timeslots).macro).to be :has_many
  end

  it 'does not save when username has uppercase' do
    user = build(:user, username: 'opasdveAWNA')
    expect(user.save).to be false
  end

  it 'does not save when username has special characters' do
    user = build(:user, username: '~!@#$%^& *()_+=')
    expect(user.save).to be false
  end

  it 'does not save when username is less then 4 characters' do
    user = build(:user, username: '123')
    expect(user.save).to be false
  end

  it 'saves when username is 4 characters' do
    user = build(:user, username: '1234')
    expect(user.save).to be true
  end

  it 'does not save when username is more than 20 characters' do
    user = build(:user, username: 'qwertyuiopasdfghjklzx')
    expect(user.save).to be false
  end

  it 'saves when username is 20 characters' do
    user = build(:user, username: 'qwertyuiopasdfghjklz')
    expect(user.save).to be true
  end

  it 'does not save when email is not in the correct format' do
    user = build(:user, email: 'hallelujah essaim')
    expect(user.save).to be false
  end
end
