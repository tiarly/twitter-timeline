require 'rails_helper'

RSpec.describe 'Listing Tweets timeline', feature: true do
  let(:user) { FactoryGirl.create(:user) }
  before { sign_in(user) }

  scenario 'when a user submits the form with a username with tweets' do
    allow(TwitterTimeline).to receive(:client).and_return(FakeTwitterClient.new)

    fill_in 'username', with: '@username'
    click_button 'Fetch Tweets'

    expect(page).to have_selector(:css, 'ul.tweets')
  end

  scenario 'when a user submits the form with a username with no tweets' do
    allow(TwitterTimeline).to receive(:client).and_return(
      FakeTwitterClient.new(faker_response: [])
    )

    fill_in 'username', with: '@user_with_no_tweets'
    click_button 'Fetch Tweets'

    expect(page).to have_content 'No tweets found for @user_with_no_tweets'
  end

  scenario 'when a user doesnt fill in a username' do
    click_button 'Fetch Tweets'

    expect(page).to have_content 'To start, fill in a twitter username, ok?'
  end
end
