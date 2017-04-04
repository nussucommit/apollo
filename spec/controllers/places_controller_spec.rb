require 'rails_helper'

RSpec.describe PlacesController, type: :controller do
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

    it 'is empty when first created' do
      expect(:new).to be_empty
    end
  end

  describe 'POST #create' do
    it 'creates a new place successfully' do
      user = create(:user)
      place = create(:place)

      sign_in user

      post :create, params: { place: attributes_for(:place) }
      expect(Place.find_by(name: place.name)).not_to be nil
    end
  end

  describe 'GET #edit' do
    it 'redirects to login without a user' do
      place = create(:place)
      get :edit, params: { place_id: place.id }
      expect(response).to redirect_to new_user_session_path
    end

    it 'does it successfully with a user logged in' do
      sign_in create(:user)
      place = create(:place)
      get :edit, params: { place_id: place.id }
      expect(response).to have_http_status :ok
    end
  end
end
