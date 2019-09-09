require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { FactoryBot.create :user }

  describe '#show' do
    it 'responds successfully' do
      get :show, params: { id: user.id }
      expect(response).to be_successful
    end

    it 'returns a 200 response' do
      get :show, params: { id: user.id }
      expect(response).to have_http_status '200'
    end
  end

  describe '#edit' do
    context 'as an authorized user' do
      before(:each) { sign_in user }

      it 'responds successfully' do
        get :edit, params: { id: user.id }
        expect(response).to be_successful
      end

      it 'returns a 200 response' do
        get :edit, params: { id: user.id }
        expect(response).to have_http_status '200'
      end
    end

    context 'as guest' do
      it 'returns a 302 response' do
        post :edit, params: {id: user.id}
        expect(response).to have_http_status '302'
      end

      it 'redirects to the sign-in page' do
        post :edit, params: {id: user.id}
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end
end
