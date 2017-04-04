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

  describe 'PATCH #process_grab' do
    it 'redirects to login without a user' do
      patch :process_grab
      expect(response).to redirect_to new_user_session_path
    end

    it 'grabs the duty successfully' do
      user = create(:user)
      duty = create(:duty, user: nil)

      sign_in user

      patch :process_grab, params: { user_id: user.id, duty_id: duty.id }

      duty.reload
      expect(duty.user).to eq user
    end

    it 'redirects to index upon successful grab' do
      user = create(:user)
      duty = create(:duty, user: nil)

      sign_in user

      patch :process_grab, params: { user_id: user.id, duty_id: duty.id }

      expect(response).to redirect_to duties_path
    end

    it 'shows correct flash message upon successful grab' do
      user = create(:user)
      duty = create(:duty, user: nil)

      sign_in user

      patch :process_grab, params: { user_id: user.id, duty_id: duty.id }

      expect(flash[:notice]).to eq 'Successfully grabbed duty!'
    end

    it 'shows error if user is not found' do
      user = create(:user)
      duty = create(:duty, user: nil)

      sign_in user

      patch :process_grab, params: { user_id: user.id, duty_id: duty.id }

      expect do
        patch :process_grab, params: { user_id: -1, duty_id: duty.id }
      end.to raise_error ActiveRecord::RecordNotFound
    end

    it 'shows error if duty is not found' do
      user = create(:user)
      duty = create(:duty, user: nil)

      sign_in user

      expect do
        patch :process_grab, params: { user_id: user.id, duty_id: -1 }
      end.to raise_error ActiveRecord::RecordNotFound
    end

    it 'flashes alert if user of the duty is not nil' do
      user = create(:user)
      duty = create(:duty)

      sign_in user

      patch :process_grab, params: { user_id: user.id, duty_id: duty.id }

      expect(flash[:alert]).to eq 'Failed to grab duty!'
    end

    it 'redirects to index upon failed grab' do
      user = create(:user)
      duty = create(:duty)

      sign_in user

      patch :process_grab, params: { user_id: user.id, duty_id: duty.id }

      expect(response).to redirect_to duties_path
    end
  end

  describe 'PATCH #process_drop' do
    it 'redirects to login without a user' do
      patch :process_drop
      expect(response).to redirect_to new_user_session_path
    end

    it 'drops the duty successfully' do
      user = create(:user)
      duty = create(:duty, user: user)

      sign_in user

      patch :process_drop, params: { duty_id: duty.id }

      duty.reload
      expect(duty.user).to eq nil
    end

    it 'redirects to index upon successful drop' do
      user = create(:user)
      duty = create(:duty, user: user)

      sign_in user

      patch :process_drop, params: { duty_id: duty.id }

      expect(response).to redirect_to duties_path
    end

    it 'shows correct flash message upon successful drop' do
      user = create(:user)
      duty = create(:duty, user: user)

      sign_in user

      patch :process_drop, params: { duty_id: duty.id }

      expect(flash[:notice]).to eq 'Successfully dropped duty!'
    end

    it 'shows error if user is not found' do
      user = create(:user)
      duty = create(:duty, user: user)

      sign_in user

      patch :process_drop, params: { duty_id: duty.id }

      expect(flash[:notice]).to eq 'Successfully dropped duty!'
    end

    it 'shows error if duty is not found' do
      user = create(:user)
      create(:duty, user: user)

      sign_in user

      expect do
        patch :process_drop, params: { duty_id: -1 }
      end.to raise_error ActiveRecord::RecordNotFound
    end

    it 'redirects to index upon failed grab' do
      user = create(:user)
      duty = create(:duty)

      sign_in user

      patch :process_drop, params: { duty_id: duty.id }

      expect(response).to redirect_to duties_path
    end
  end

  describe 'GET #mass_edit' do
    it 'redirects to login without user' do
      get :mass_edit
      expect(response).to redirect_to new_user_session_path
    end

    it 'gets duties from specified weeks' do
      get :mass_edit, params: { week_offset: 0 }

      expect(response).to redirect_to new_user_session_path
    end
  end

  describe 'PATCH #mass_update' do
    it 'redirects to login without user' do
      patch :mass_update
      expect(response).to redirect_to new_user_session_path
    end

    it 'update the duties successfully' do
      user = create(:user)
      duties = create_list(:duty, 3)

      sign_in user

      patch :mass_update, params: { duty_ids: duties.pluck(:id),
                                    user_id: user.id }

      duties.each do |duty|
        duty.reload
        expect(duty.user).to eq user
      end
    end

    it 'redirects to get upon successful update' do
      user = create(:user)
      duties = create_list(:duty, 3)

      sign_in user

      patch :mass_update, params: { duty_ids: duties.pluck(:id),
                                    user_id: user.id }

      expect(response).to redirect_to mass_edit_duties_path
    end

    it 'shows notice upon successfull mass update' do
      user = create(:user)
      duties = create_list(:duty, 3)

      sign_in user

      patch :mass_update, params: { duty_ids: duties.pluck(:id),
                                    user_id: user.id }

      expect(flash[:notice]).to eq 'Successfully updated duties!'
    end

    it 'shows error if duty is not found' do
      user = create(:user)
      duties = create(:duty)

      sign_in user

      expect do
        patch :mass_update, params: { duties: duties }
      end.to raise_error ActiveRecord::RecordNotFound
    end

    it 'redirects to index upon failed update' do
      user = create(:user)
      duties = create_list(:duty, 3)

      sign_in user

      patch :mass_update, params: { duty_ids: duties.pluck(:id),
                                    user_id: user.id }

      expect(response).to redirect_to mass_edit_duties_path
    end
  end
end
