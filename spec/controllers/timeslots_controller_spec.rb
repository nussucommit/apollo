require 'rails_helper'

RSpec.describe TimeslotsController, type: :controller do
  describe 'GET #mass_set_default_select' do
    it 'gets everything specified' do
      user = create(:user)
      timeslot = create(:timeslot)
      duties = create(:duty)

      get :mass_set_default_select, params: { user_id: user.id,
                                              timeslot_id: timeslot.id,
                                              duty_ids: duties.id }

      expect(response).to have_http_status :ok
    end
  end

  describe 'PATCH #mass_set_default_process' do
    it 'successfully mass sets default user' do
      user = create(:user)
      timeslot = create(:timeslot)
      duties = create(:duty)

      patch :mass_set_default_process, params: { user_id: user.id,
                                                 duty_ids: duties.id,
                                                 timeslot_id: timeslot.id }

      expect(duty.timeslot.default_user).to eq user
    end

    it 'shows error if user is not found' do
      timeslot = create(:timeslot)
      duties = create(:duty)

      expect do
        patch :mass_set_default_process, params: { user_id: -1,
                                                   duty_ids: duties.id,
                                                   timeslot_id: timeslot.id }
      end.to raise_error ActiveRecord::RecordNotFound
    end

    it 'shows error if duties are not found' do
      user = create(:user)
      timeslot = create(:timeslot)

      expect do
        patch :mass_set_default_process, params: { user_id: user.id,
                                                   duty_ids: -1,
                                                   timeslot_id: timeslot.id }
      end.to raise_error ActiveRecord::RecordNotFound
    end

    it 'shows error if user is not found' do
      user = create(:user)
      duties = create(:duty)

      expect do
        patch :mass_set_default_process, params: { user_id: user.id,
                                                   duty_ids: duties.id,
                                                   timeslot_id: -1 }
      end.to raise_error ActiveRecord::RecordNotFound
    end
  end
end
