require 'test_helper'
require 'minitest/autorun'
require 'minitest/should'
require 'support/database_cleaner'

describe UsersController, type: :controller do
  include Devise::TestHelpers
  include Warden::Test::Helpers
  let(:user) { FactoryGirl.create(:user) }

  describe 'when user is logged in' do
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in(user)
    end

    describe 'GET index' do
      it 'assigns @users' do
        get :index
        assigns(:users).must_include(user)
      end

      it 'renders the index template' do
        get :index
        assert_response :success
      end
    end

    describe 'GET #show' do
      it 'assigns the requested user to @user' do
        get :show, id: user
        assigns(:user).must_equal(user)
      end

      it 'renders the #show view' do
        get :show, id: user
        assert_response :success
      end
    end
  end

  describe 'POST create' do
    describe 'with valid attributes' do
      it 'creates a new user' do
        assert_difference 'User.count', 1 do
          post :create, user: user.attributes
        end
      end
    end
  end
end
