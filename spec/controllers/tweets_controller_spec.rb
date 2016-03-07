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

  it 'rescue from Twitter::Error::NotFound' do
    sign_in FactoryGirl.create(:user)

    allow(TwitterTimeline).to receive(:client)
      .and_raise(Twitter::Error::NotFound)

    get :index, username: '@invalid_user'

    expect(response).to be_success
    expect(response).to render_template :username_not_found
  end
end
