# == Schema Information
#
# Table name: timeslots
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  mc_only       :boolean
#  day           :integer
#  user_id       :integer
#  time_range_id :integer
#  place_id      :integer
#
# Indexes
#
#  index_timeslots_on_place_id       (place_id)
#  index_timeslots_on_time_range_id  (time_range_id)
#  index_timeslots_on_user_id        (user_id)
#

require 'rails_helper'

RSpec.describe Timeslot, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
