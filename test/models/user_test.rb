require 'test_helper'
require 'minitest/autorun'
require 'minitest/should'

describe User do
  let(:user) { FactoryGirl.create(:user) }
  let(:admin_user) { FactoryGirl.create(:user, :admin) }

  describe 'user valid?' do
    it 'user has correct fields' do
      expect(user.valid?).must_equal(true)
    end
  end

  describe 'name validation' do
    it 'user has first and last name' do
      user.first_name = nil
      user.last_name = nil
      expect(user.valid?).must_equal(false)
    end
  end

  describe 'address validation' do
    it 'user has correct fields' do
      user.address = nil
      expect(user.valid?).must_equal(false)
    end
  end

  describe 'phone validation' do
    it 'user has correct phone format' do
      user.phone_number_primary = '51-83315554'
      expect(user.valid?).must_equal(false)
    end
  end

  describe 'terms and age validation' do
    it 'user has has terms checked' do
      user.terms_of_service = nil
      user.age_verification = nil
      expect(user.valid?).must_equal(false)
    end
  end

  describe '#accepted_tos_age_verify?' do
    it 'is valid when user agrees to terms' do
      user.terms_of_service = false
      user.age_verification = false
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
      expect(admin_user.admin?).must_equal(true)
    end
  end
end
