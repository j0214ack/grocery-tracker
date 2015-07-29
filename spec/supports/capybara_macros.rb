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

def expect_sign_in_success(user)
  expect(page).to have_text "Welcome"
  expect(page).to have_text user.name
end

def expect_showing_user_grocery_list
  expect(page).to have_text "My Grocery List"
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

def expect_having_item(item)
  if item.is_a? Grocery
    expect(page).to have_content item.name
    expect(page).to have_content item.quantity
    expect(page).to have_content item.show_exp_date
  elsif item.is_a? Hash
    expect(page).to have_content item[:name]
  end
end

def click_add_item
  click_on "+ Add Item"
end

def confirm_alert
  page.driver.browser.switch_to.alert.accept    
end
