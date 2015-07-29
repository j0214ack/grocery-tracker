require 'rails_helper'
require 'supports/capybara_macros'

feature 'User signs up' do
  scenario 'user signs up with valid information' do
    visit root_path

    fill_in_sign_up_form
    click_sign_up_button

    expect_sign_up_success
    expect_showing_user_grocery_list
  end
end
