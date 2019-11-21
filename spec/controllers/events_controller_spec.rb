require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  let(:user) { FactoryBot.create :user }
  let(:event) { FactoryBot.create :event, user: user }

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
    context 'logged in user' do
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

    context 'guest' do
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
    context 'logged in user' do
      context 'with invalid attributes' do
        it 'adds a event' do
          event_params = FactoryBot.attributes_for(:event)
          sign_in user
          expect {
            post :create, params: {event: event_params}
          }.to change(user.events, :count).by(1)
        end
      end

      context 'with invalid attributes' do
        it 'does not add a event' do
          event_params = FactoryBot.attributes_for(:event, :invalid)
          sign_in user
          expect {
            post :create, params: { event: event_params}
          }.to_not change(user.events, :count)
        end
      end
    end

    context 'guest' do
      it 'returns a 302 response' do
        event_params = FactoryBot.attributes_for(:event)
        post :create, params: {event: event_params}
        expect(response).to have_http_status '302'
      end

      it 'redirects to the sign-in page' do
        event_params = FactoryBot.attributes_for(:event)
        post :create, params: {event: event_params}
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end

  describe '#update' do
    context 'as logged in user' do
      it 'updates a event' do
        event_params = FactoryBot.attributes_for(:event,
                                                 title: "New events title")
        sign_in user
        patch :update, params: {id: event.id, event: event_params}
        expect(event.reload.title).to eq "New events title"
      end
    end
  end

  describe '#destroy' do
    context 'logged in user' do
      it 'deletes the event' do
        event = FactoryBot.create(:event, user: user)
        sign_in user
        expect {
          delete :destroy, params: {id: event.id}
        }.to change(user.events, :count).by(-1)
        expect(response).to have_http_status(:redirect)
      end
    end
  end
end
