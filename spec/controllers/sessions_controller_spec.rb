require 'rails_helper'

describe SessionsController do
  describe "GET new" do
    context 'when user already signed in' do
      it "redirects to user's grocery list page"
      it "shows a flash error message"
    end

    context 'when user not signed in' do
      it 'render the sign in page'
    end
  end

  describe 'POST create' do
    context 'when user already signed in' do
      it "redirects to user's grocery list page"
      it "shows a flash error message"
    end

    context 'when provided with valid information' do
      it "sets the session['user_id'] to user's id"
      it "redirects to user's grocery list page"
      it "shows a flash success message"
    end

    context 'when provided with invalid information' do
      it 'renders the sign in page'
      it 'shows a flash error message'
    end
  end
end
