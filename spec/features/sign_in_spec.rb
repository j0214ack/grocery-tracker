require 'rails_helper'

feature 'user signs in' do
  scenario 'user signs in with valid information' do
    user = Fabricate(:user)

    visit root_path
    click_sign_in_link

    fill_in_sign_in_form(user)
    click_sign_in_button

    expect_sign_in_success
    expect_showing_user_grocery_list
  end

  def click_sign_in_link
    click_on 'Sign In'
  end

  def fill_in_sign_in_form(user)
    fill_in 'Email Address', with: user.email
    fill_in 'Password', with: 'password'
  end

  def click_sign_in_button
    click_on 'Sign In'
  end

  def expect_sign_in_success
    expect(page).to have_text "Signed In!"
  end

  def expect_showing_user_grocery_list
    expect(page).to have_text "My Grocery List"
  end
end
