require 'rails_helper'

RSpec.describe 'Signup', feature: true do
  let(:user) { FactoryGirl.build(:user) }

  scenario 'When filing in all required fields correctly' do
    visit '/users/sign_up'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password

    click_button 'Sign up'

    expect(page).to have_content 'You have signed up successfully'
  end
end
