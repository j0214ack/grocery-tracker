require 'rails_helper'
require 'supports/macros.rb'

feature 'grocery list' do
  scenario 'signed user sees grocery items' do
    milk = Grocery.new(name: 'milk',
                       count: 1,
                       unit: 'L',
                       exp_date: Date.tomorrow,
                       user: user)

    steak = Grocery.new(name: 'steak',
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

  end

  scenario 'signed user updates an item in the list' do

  end

  scenario 'signed user deletes an item from the list' do

  end

  def expect_having_item(item)
    expect(page).to have_content item.name
    expect(page).to have_content item.quantity
    expect(page).to have_content item.exp_date
  end
end
