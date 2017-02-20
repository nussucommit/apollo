# == Schema Information
#
# Table name: time_ranges
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  start      :datetime
#  end        :datetime
#

require 'rails_helper'

RSpec.describe TimeRange, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
