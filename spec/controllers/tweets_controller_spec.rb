require 'rails_helper'

RSpec.describe TweetsController, type: :controller do
it "blocks unauthenticated requests" do
    get :index

    expect(response).to redirect_to(new_user_session_path)
  end

  it "allows authenticated users" do
    sign_in FactoryGirl.create(:user)

    get :index

    expect(response).to be_success
  end
end
