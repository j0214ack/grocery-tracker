require 'rails_helper'

feature 'User signs up' do
  scenario 'user signs up with valid information' do
    visit root_path

    fill_in_sign_up_form
    click_sign_up_button

    expect_sign_up_success
    expect_showing_user_grocery_list
  end

  def fill_in_sign_up_form
    fill_in 'Email Address', with: 'joe@example.com'
    fill_in 'Name', with: 'joe'
    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
  end

  def click_sign_up_button
    click_on 'Sign Up'
  end

  def expect_sign_up_success
    expect(page).to have_text "Signed Up!"
  end

  def expect_showing_user_grocery_list
    expect(page).to have_text "My Grocery List"
  end
end
