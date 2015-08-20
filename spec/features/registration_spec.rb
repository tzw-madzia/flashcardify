require 'rails_helper'

feature 'Registration' do
  let!(:user) { create(:user) }

  scenario 'user is able to sign in' do
    visit '/'
    click_on('Log in')
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    page.find('.btn-primary').click
    expect(page).to have_content('Signed in successfully.')
  end
end
