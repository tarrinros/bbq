require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  let(:event) { FactoryBot.create :event }
  let(:user) { FactoryBot.create :user }

  describe '#index' do
    it 'responds successfully' do
      get :index
      expect(response).to be_successful
    end

    it 'returns a 200 response' do
      get :index
      expect(response).to have_http_status '200'
    end
  end

  describe '#show' do
    it 'responds successfully' do
      get :show
      expect(response).to be_successful
    end

    it 'returns a 200 response' do
      get :show
      expect(response).to have_http_status '200'
    end
  end

  describe '#new' do
    context 'as logged in user' do
      before(:each) { sign_in user }

      it 'returns a 200 response' do
        get :new
        expect(response).to have_http_status '200'
      end

      it 'responds successfully' do
        get :new
        expect(response).to be_successful
      end
    end

    context 'as a guest' do
      it 'returns a 302 response' do
        get :new
        expect(response).to have_http_status '302'
      end

      it 'redirects to the sign-in page' do
        get :new
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end

  describe '#create' do
    context 'as logged in user' do
      it 'adds a event' do
        event_params = FactoryBot.attributes_for(:event)
        sign_in user
        expect {
          post :create, params: { event: event_params }
        }.to change(user.events, :count).by(1)
      end
    end

    context 'as a guest' do
      it 'returns a 302 response' do
        event_params = FactoryBot.attributes_for(:event)
        post :create, params: {event: event_params }
        expect(response).to have_http_status '302'
      end

      it 'redirects to the sign-in page' do
        event_params = FactoryBot.attributes_for(:event)
        post :create, params: {event: event_params }
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end
end
