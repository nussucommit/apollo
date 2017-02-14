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

class User < ApplicationRecord
end
