require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "#show" do
   it "responds successfully" do
    get :show
    expect(response).to be_success
   end
  end
end
