# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  username               :string           not null
#  name                   :string           not null
#  email                  :string           default(""), not null
#  matric_number          :string           not null
#  phone_number           :string           not null
#  cell                   :string           not null
#  position               :string           not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_matric_number         (matric_number) UNIQUE
#  index_users_on_phone_number          (phone_number) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#

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
