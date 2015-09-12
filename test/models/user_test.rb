require "test_helper"
require "minitest/autorun"
require "minitest/should"

describe User do

  let(:user) { FactoryGirl.create(:user) }

  describe 'user valid?' do
    it 'user has correct fields' do
      expect(user.valid?).must_equal(true)
    end
  end

  describe 'address validation' do
    user = User.create(first_name: 'dick', last_name: 'wood', password: "password1",
      address: nil , phone_number_primary: '5183315554', email: "test100@test.com", terms_of_service: nil,
      age_verification: nil)

    it 'user has correct fields' do
      expect(user.valid?).must_equal(false)
    end
  end

  describe 'phone validation' do
    user = User.create(first_name: 'dick', last_name: 'wood', password: "password1",
      address: nil , phone_number_primary: '51-83315554', email: "test109@test.com", terms_of_service: nil,
      age_verification: nil)

    it 'user has correct fields' do
      expect(user.valid?).must_equal(false)
    end
  end

  describe 'email validation' do
    user = User.create(first_name: 'dick', last_name: 'wood', password: "password1",
      address: '104 something lane', email: "pa")

    it 'user has correct fields' do
      expect(user.valid?).must_equal(false)
    end
  end

  describe 'terms and age validation' do
    user = User.create(first_name: 'dick', last_name: 'wood', password: "password1",
      address: '104 something lane', email: "test101@test.com", terms_of_service: nil,
      age_verification: nil)

    it 'user has correct fields' do
      expect(user.valid?).must_equal(false)
    end
  end

  describe '#name' do
    it 'has a name' do
      expect(user.name).must_equal("#{user.first_name} #{user.last_name}")
    end
  end

  describe 'roles' do
    it 'has certain valid roles' do
      expect(User.valid_roles).must_equal([:customer, :admin])
    end
  end

  describe '#customer?' do
    it 'user is a customer' do
      expect(user.customer?).must_equal(true)
    end
  end

  describe '#admin?' do
    it 'user is an admin' do
      user.roles << :admin
      user.save!
      expect(user.admin?).must_equal(true)
    end
  end
end
