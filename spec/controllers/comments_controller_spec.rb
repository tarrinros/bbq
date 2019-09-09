require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:user) { FactoryBot.create :user }
  let(:second_user) { FactoryBot.create :user }
  let(:event) { FactoryBot.create :event, user: second_user }
  let(:comment) { event.comments.create!(user_id: user.id,
                                         body: 'test comment',
                                         user_name: 'Tester') }

  describe '#create' do
    it 'creates a comment' do
      new_comment = { body: 'New test comment', user_name: 'Tester' }
      expect {
        post :create, params: {event_id: event.id, comment: new_comment}
      }.to change(event.comments, :count).by(1)
    end
  end

  describe '#destroy' do
    context 'logged in user' do
      it 'deletes a comment' do
        sign_in second_user
        expect {
          delete :destroy, params: {id: comment.id}
        }.to change(event.comments, :count).by(-1)
      end
    end
  end
end
