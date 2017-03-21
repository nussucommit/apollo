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
      duty = create(:duty, user: user)

      sign_in user

      expect do
        patch :process_drop, params: { duty_id: 999_999 }
      end.to raise_error ActiveRecord::RecordNotFound
    end

    it 'flashes alert if user of the duty is nil' do
      user = create(:user)
      duty = create(:duty)

      sign_in user

      patch :process_drop, params: { duty_id: duty.id }

      expect(flash[:alert]).to eq 'Failed to drop duty!'
    end

    it 'redirects to index upon failed grab' do
      user = create(:user)
      duty = create(:duty)

      sign_in user

      patch :process_drop, params: { duty_id: duty.id }

      expect(response).to redirect_to duties_path
    end
  end

  describe 'GET #edit' do
    it 'redirects to login without user' do
      get :edit
      expect(response).to redirect_to_new_user_session_path
    end

    it 'gets duties from specified weeks' do
      get :edit, params: { week_offset: 0 }

      expect(response).to redirect_to_new_user_session_path # dunno what syntax to expect duties given weeks
    end
  end

  describe 'PATCH #update' do
    it 'redirects to login without user' do
      patch :edit
      expect(response).to redirect_to_new_user_session_path
    end

    it 'edits the duties successfully' do
      user = create(:user)
      duties = create(:duty)

      sign_in user

      patch :edit, params: { duties: duties } # how to get multiple duties as test case?
  
      duties.each do |duty_id, user_id|
        expect(duty.user).to_eq user_id
      end
    end

    it 'redirects to get upon successful edit' do
      user = create(:user)
      duties = create(:duty)

      sign_in user

      patch :edit, params: { duties: duties } # how to get multiple duties as test case?
    
      expect(response).to redirect_to duties_path
    end

    it 'shows error if duty is not found' do
      user = create(:user)
      duties = create(:duty)

      sign_in user

      expect do
        patch :edit, params: { duties: duties }
      end.to raise_error ActiveRecord::RecordNotFound
    end

    it 'redirects to index upon failed edit' do
      user = create(:user)
      duties = create(:duty)

      sign_in user

      patch :edit, params: { duties: duties }

      expect(response).to redirect_to duties_path
    end
  end
end
