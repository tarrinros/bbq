require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a name, email, and password" do
    user = User.new(
      name: "Vanya",
      email: "tester@example.com",
      password: "dottle-nouveau-pavilion-tights-furze"
    )
    expect(user).to be_valid
  end

  it "is invalid without a name" do
    user = User.new(
      name: nil,
      email: "tester@example.com",
      password: "dottle-nouveau-pavilion-tights-furze"
    )
    user.valid?
    expect(user.errors[:name]).to include("не может быть пустым")
  end

  it "is invalid without an email address" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("не может быть пустым")
  end

  it "is invalid with a duplicate email address" do
    User.create(
      name: "Alex",
      email: "tester@example.com",
      password: "dottle-nouveau-pavilion-tights-furze",
      )
      
      user = User.new(
      name: "Gosha",
      email: "tester@example.com",
      password: "dottle-nouveau-pavilion-tights-furze",
      )
      
      user.valid?
      expect(user.errors[:email]).to include("уже существует")
  end
end
