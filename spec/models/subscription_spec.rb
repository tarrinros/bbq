require 'rails_helper'

RSpec.describe Subscription, type: :model do
  let(:user) { FactoryBot.create :user }
  let(:event) { FactoryBot.create(:event, user: user) }
  let(:subscription) { FactoryBot.create(:subscription, user: user, event: event) }

  it 'is valid with a event, user_name, user_email' do
    expect(subscription).to be_valid
  end

  it 'is invalid without a event' do
    subscription.event = nil
    subscription.valid?
    expect(subscription.errors[:event]).to include('не может отсутствовать')
  end

  it 'returns user_name as string' do
    user.name = 'Tester Testerov'
    expect(subscription.user_name).to eq 'Tester Testerov'
  end

  it 'returns user_email as string' do
    expect(subscription.user_email).to include('@example.com')
  end
end
