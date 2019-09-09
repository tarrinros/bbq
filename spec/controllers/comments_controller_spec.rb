require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:user) { FactoryBot.create :user }
  let(:event) { FactoryBot.create :event, user: user }

  describe '#create' do
    it 'creates a comment' do
      new_comment = { body: 'New test comment', user_name: 'Tester' }
      expect {
        post :create, params: {event_id: event.id, comment: new_comment}
      }.to change(event.comments, :count).by(1)
    end
  end
end
