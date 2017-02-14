# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  username      :string
#  name          :string
#  email         :string
#  matric_number :string
#  phone_number  :string
#  cell          :string
#  position      :string
#

class User < ApplicationRecord
end
