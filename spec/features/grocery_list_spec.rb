require 'rails_helper'
require 'supports/macros.rb'
require 'supports/capybara_macros.rb'

feature 'grocery list' do
  scenario 'signed user sees grocery items' do
    user = Fabricate(:user)

    milk = Grocery.create!(name: 'milk',
                       count: 1,
                       unit: 'L',
                       exp_date: Date.tomorrow,
                       user: user)

    steak = Grocery.create!(name: 'steak',
                        count: 500,
                        unit: 'g',
                        exp_date: Date.tomorrow + 1,
                        user: user)

    visit root_path
    click_sign_in_link

    fill_in_sign_in_form(user)
    click_sign_in_button

    visit groceries_path
    expect_having_item(milk)
    expect_having_item(steak)
  end

  scenario 'signed user adds an item to list' do
    user = Fabricate(:user)

    onion = {
      name: 'onion',
      count: 1,
      unit: 'piece',
      exp_date: Date.tomorrow,
      user: user
    }

    visit root_path
    click_sign_in_link

    fill_in_sign_in_form(user)
    click_sign_in_button

    visit groceries_path
    click_add_item
    fill_in_item_info(onion)
    click_add_item

    expect_having_item(onion)
  end

  scenario 'signed user updates an item in the list' do
    user = Fabricate(:user)

    milk = Grocery.create!(name: 'milk',
                       count: 1,
                       unit: 'L',
                       exp_date: Date.tomorrow,
                       user: user)

    visit root_path
    click_sign_in_link

    fill_in_sign_in_form(user)
    click_sign_in_button

    visit groceries_path
    click_update_item(milk)

    new_milk = { name: 'milk', count: 2, unit: 'galon' }

    fill_in_update_info(new_milk)
    click_update_item

    expect_item_updated(new_milk)
  end

  scenario 'signed user deletes an item from the list', js: true do
    visit root_path

    fill_in_sign_up_form
    click_sign_up_button

    onion = {
      name: 'onion',
      count: 1,
      unit: 'piece',
      exp_date: Date.tomorrow,
    }

    click_add_item
    fill_in_item_info(onion)
    click_add_item

    visit groceries_path
    click_delete_item(onion)
    confirm_alert

    expect_item_disappear(onion)
  end
end

def fill_in_item_info(item)
  fill_in 'Item Name:', with: item[:name]
  fill_in 'Count:', with: item[:count]
  fill_in 'Unit:', with: item[:unit]
  fill_in 'Exp. Date:', with: item[:exp_date]
end

def click_update_item(item = nil)
  if item
    click_on item.name
  else
    click_on "Update"
  end
end

def fill_in_update_info(item)
  fill_in 'Count:', with: item[:count]
  fill_in 'Unit:', with: item[:unit]
end

def expect_item_updated(item)
  expect(page).to have_content item[:name]
  expect(page).to have_content "#{item[:count]} #{item[:unit]}"
end

def click_delete_item(item)
  id = Grocery.find_by(name: item[:name]).id
  click_on "delete_grocery_#{id}"
end

def expect_item_disappear(item)
  expect(page).not_to have_content item[:name]
end
