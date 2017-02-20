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

class Duty < ApplicationRecord
  belongs_to :timeslot
  belongs_to :user, optional: true
  validates :timeslot_id, :date, presence: true
end
