require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:user) { FactoryBot.create :user }

  it "is valid with a user, title, address and datetime" do
    event = Event.new(
      user: user,
      title: 'Test BBQ event',
      address: 'Moscow, Lomonosov str. 12',
      datetime: Time.now
    )
    expect(event).to be_valid
  end
end
