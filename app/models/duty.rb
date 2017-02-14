# == Schema Information
#
# Table name: duties
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  date        :date
#  timeslot_id :integer
#  user_id     :integer
#
# Indexes
#
#  index_duties_on_timeslot_id  (timeslot_id)
#  index_duties_on_user_id      (user_id)
#

class Duty < ApplicationRecord
end
