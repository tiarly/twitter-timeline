require 'rails_helper'

RSpec.describe 'Signin', feature: true do
  let(:user) { FactoryGirl.create(:user) }

  scenario 'When logging with correct credentials' do
    sign_in user

    expect(page).to have_content 'Signed in successfully'
  end
end
