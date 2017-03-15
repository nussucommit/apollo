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

      expect(flash[:notice]).to eq 'Successfully grabbed duty!'
    end

    it 'shows error if duty is not found' do
      user = create(:user)
      duty = create(:duty, user: nil)

      sign_in user

      expect do
        patch :process_grab, params: { user_id: 999_999, duty_id: duty.id }
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
end
