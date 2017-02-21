require 'rails_helper'

RSpec.describe OthersController, type: :controller do
  describe 'GET #admin' do
    it 'redirects to login without a user' do
      get :admin
      expect(response).to redirect_to new_user_session_path
    end

    it 'does it successfully with a user logged in' do
      sign_in create(:user)
      get :admin
      expect(response).to have_http_status :ok
    end
  end
end
