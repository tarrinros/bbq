require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:user) { FactoryBot.create :user }
  let(:event) { FactoryBot.create(:event, user: user) }


  it "is valid with a user, title, address and datetime" do
    expect(event).to be_valid
  end

  it "is invalid without a title" do
    event.title = nil
    event.valid?
    expect(event.errors[:title]).to include("не может быть пустым")
  end

  it "is invalid without a address" do
    event.address = nil
    event.valid?
    expect(event.errors[:address]).to include("не может быть пустым")
  end

  it "is invalid without a datetime" do
    event.datetime = nil
    event.valid?
    expect(event.errors[:datetime]).to include("не может быть пустым")
  end
end
