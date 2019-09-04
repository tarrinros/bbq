require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create :user }

  it 'is valid with a name, email, and password' do
    expect(user).to be_valid
  end

  it 'is invalid without a name' do
    user.name = nil
    user.valid?
    expect(user.errors[:name]).to include('не может быть пустым')
  end

  it 'is invalid without an email address' do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include('не может быть пустым')
  end

  it 'is invalid with a duplicate email address' do
    FactoryBot.create(:user, email: "tester@example.com")
    user = FactoryBot.build(:user, email: "tester@example.com")
    user.valid?
    expect(user.errors[:email]).to include('уже существует')
  end

  it 'generates users name before validation' do
    user = User.create(
      name: nil,
      email: "tester@example.com",
      password: "dottle-nouveau-pavilion-tights-furze"
    )
    user.valid?
    expect(user.name).not_to be_empty
    expect(user.name).to include('Tovarisch')
  end
end
