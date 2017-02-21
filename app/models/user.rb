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

class User < ApplicationRecord
  has_many :duties
  has_many :timeslots
  validates :username, :name, :email, :matric_number, presence: true
  validates :phone_number, :cell, :position, presence: true
  validates :username, :email, :matric_number, :phone_number, uniqueness: true
  validates :username, format:
    { with: /\A[a-z0-9]+\z/, message: 'lowercase letters and numbers only' }
  validates :username, length: { in: 4..20 }
  validates :email, format:
    { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
end
