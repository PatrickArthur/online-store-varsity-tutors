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

  describe '#name' do
    it 'has a name' do
      expect(user.name).must_equal("#{user.first_name} #{user.last_name}")
    end
  end

end
