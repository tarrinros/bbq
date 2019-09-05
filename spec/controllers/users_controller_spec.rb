require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { FactoryBot.create :user }

  describe '#show' do
    before(:each) { sign_in user }

    it 'responds successfully' do
      get :show
      expect(response).to be_successful
    end

    it 'returns a 200 response' do
      get :show
      expect(response).to have_http_status '200'
    end
  end
end