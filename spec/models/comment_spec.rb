require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { FactoryBot.create :user }
  let(:event) { FactoryBot.create(:event, user: user) }
  let(:comment) { FactoryBot.create(:comment, user: user, event: event) }

  it "is valid with a body, event, user_name" do
    expect(comment).to be_valid
  end

  it "is invalid without a body" do
    comment.body = nil
    comment.valid?
    expect(comment.errors[:body]).to include("не может быть пустым")
  end

  it "is invalid without a event" do
    comment.event = nil
    comment.valid?
    expect(comment.errors[:event]).to include("не может отсутствовать")
  end
end
