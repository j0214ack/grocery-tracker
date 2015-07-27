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
  end

  describe 'POST create' do
    context 'when user already signed in' do
      before do
        login_user
        post :create
      end

      it "redirects to user's grocery list page" do
        expect(response).to redirect_to groceries_path
      end

      it "shows a flash error message" do
        expect(flash[:error]).to be_present
      end
    end

    context 'when provided with valid information' do
      let(:user) { Fabricate(:user) }

      it "sets the session[:user_id] to user's id" do
        post :create, { email: user.email, password: 'password' }

        expect(session[:user_id]).to eq user.id
      end

      it "redirects to user's grocery list page" do
        post :create, { email: user.email, password: 'password' }
        expect(response).to redirect_to groceries_path
      end

      it "shows a flash success message" do
        post :create, { email: user.email, password: 'password' }
        expect(flash[:success]).to be_present
      end
    end

    context 'when provided with invalid information' do
      it 'renders the sign in page' do
        post :create
        expect(response).to render_template :new
      end

      it 'shows a flash error message' do
        post :create
        expect(flash[:error]).to be_present
      end
    end
  end
end
