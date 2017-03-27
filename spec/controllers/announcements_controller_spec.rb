# == Schema Information
#
# Table name: announcements
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  contents   :text             not null
#  date       :datetime         not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe AnnouncementsController, type: :controller do
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
  end

  describe 'POST #create' do
    context 'without login' do
      it 'redirects to login without a user' do
        post :create, params: { announcement: attributes_for(:announcement) }
        expect(response).to redirect_to new_user_session_path
      end
    end

    context 'with log in' do
      before :each do
        sign_in create(:user)
      end
      it 'saves the new announcement in the database' do
        expect do
          post :create, params: { announcement: attributes_for(:announcement) }
        end.to change(Announcement, :count).by(1)
      end
      it 'shows a flash when annoncement is created' do
        post :create, params: { announcement: attributes_for(:announcement) }
        expect(flash[:notice]).to eq 'Announcement created!'
      end
      it 'redirects to announcements_path' do
        post :create, params: { announcement: attributes_for(:announcement) }
        expect(response).to redirect_to announcements_path
      end
    end
  end
end
