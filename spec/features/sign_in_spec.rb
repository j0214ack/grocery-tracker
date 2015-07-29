require 'rails_helper'
require 'supports/capybara_macros'

feature 'user signs in' do
  scenario 'user signs in with valid information' do
    user = Fabricate(:user)

    visit root_path
    click_sign_in_link

    fill_in_sign_in_form(user)
    click_sign_in_button

    expect_sign_in_success(user)
    expect_showing_user_grocery_list
  end
end
