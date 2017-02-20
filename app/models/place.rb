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

class Place < ApplicationRecord
  has_many :timeslots
  validates :name, presence: true
  validates :name, uniqueness: true
end
