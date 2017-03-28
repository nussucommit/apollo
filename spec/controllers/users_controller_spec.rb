require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
    it 'redirects to login without a user' do
      get :new
      expect(response).to redirect_to new_user_session_path
    end

    it 'does it successfully with a user logged in' do
      sign_in create(:user)
      get :new
      expect(response).to have_http_status :ok
    end
  end

  describe 'POST #create' do
    it 'redirects to login without a user' do
      post :create, params: { user: attributes_for(:user) }
      expect(response).to redirect_to new_user_session_path
    end

    it 'does it successfully with a user logged in' do
      sign_in create(:user)
      post :create, params: { user: attributes_for(:user) }
      expect(response).to have_http_status :ok
    end

    it 'shows a flash when user_params are ok' do
      sign_in create(:user)
      post :create, params: { user: attributes_for(:user) }
      expect(flash[:notice]).to eq 'User created!'
    end

    it 'adds a user to the database according to the params' do
      user = create(:user)
      sign_in create(:user)

      post :create, params: { user: attributes_for(:user) }
      expect(User.find_by(username: user.username)).not_to be nil
    end

    it 'does not show anything when user_params are not ok' do
      sign_in create(:user)
      post :create, params: { user: attributes_for(:user, username: nil) }
      expect(flash[:notice]).to be nil
    end
  end

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
