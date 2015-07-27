require 'rails_helper'
require 'supports/macros'

describe SessionsController do
  describe "GET new" do
    context 'when user already signed in' do
      before do
        login_user
        get :new
      end

      it "redirects to user's grocery list page" do
        expect(response).to redirect_to groceries_path
      end

      it "shows a flash error message" do
        expect(flash[:error]).to be_present
      end
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
