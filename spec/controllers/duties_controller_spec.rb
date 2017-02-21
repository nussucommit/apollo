require 'rails_helper'

RSpec.describe DutiesController, type: :controller do
  describe 'GET #index' do
    it 'does it successfully with' do
      get :index
      expect(response).to have_http_status :ok
    end
  end
end
