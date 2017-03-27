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

require 'rails_helper'

RSpec.describe DutiesController, type: :controller do
  describe 'GET #index' do
    it 'redirects to login without a user' do
      get :index
      expect(response).to redirect_to new_user_session_path
    end

    it 'does it successfully with a user logged in' do
      sign_in create(:user)
      get :index
      expect(response).to have_http_status :ok
    end
  end
end
