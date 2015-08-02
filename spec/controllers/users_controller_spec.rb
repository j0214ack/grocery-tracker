require 'rails_helper'
require 'supports/macros'

describe UsersController do
  describe 'GET new' do
    context 'when user already signed in' do
      before do
        login_user
        get :new
      end

      it 'sets flash[:error] message' do
        expect(flash[:error]).to be_present
      end

      it 'redirects to grocery index' do
        expect(response).to redirect_to groceries_path
      end
    end
    # valid information is tested in sign up feature test
  end

  describe 'POST create' do
    context 'when provided with invalid information' do
      before do
        post :create, user: { email: 'a@b.com', password: 'abc',
          password_confirmation: 'abcd' }
      end

      it 'sets flash[:error] message' do
        expect(flash[:error]).to be_present
      end

      it 'renders new template' do
        expect(response).to render_template :new
      end
    end

    context 'when user already signed in' do
      before do
        login_user
        post :create
      end

      it 'sets flash[:error] message' do
        expect(flash[:error]).to be_present
      end

      it 'redirects to grocery index' do
        expect(response).to redirect_to groceries_path
      end
    end
    # valid information is tested in sign up feature test
  end
end
