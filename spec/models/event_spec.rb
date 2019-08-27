require 'rails_helper'

RSpec.describe Event, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it "is valid with a user, title, address and datetime" do
    user = User.new(
      name: "Vanya",
      email: "tester@example.com",
      password: "dottle-nouveau-pavilion-tights-furze"
    )

    event = Event.new(
      user: user,
      title: 'Test BBQ event',
      address: 'Moscow, Lomonosov str. 12',
      datetime: Time.now
    )
    expect(event).to be_valid
  end
end
