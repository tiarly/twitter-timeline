require 'rails_helper'

RSpec.describe 'Signin', feature: true do
  let(:user) { FactoryGirl.create(:user) }

  scenario 'Show succesful login message' do
    visit '/'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    expect(page).to have_content 'Signed in successfully'
  end
end
