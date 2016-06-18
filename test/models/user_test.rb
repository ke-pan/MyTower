require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'user name should be more than 3 letters' do
    user = build :user, name: 'ab'
    refute user.save
    user.name = 'abc'
    assert user.save
  end

  test 'user password should be more than 6 letters' do
    user = build :user, password: 'abcde'
    refute user.save
    user.password = 'abcdef'
    assert user.save
  end
end
