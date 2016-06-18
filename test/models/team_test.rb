require 'test_helper'

class TeamTest < ActiveSupport::TestCase

  setup do
    @team = create :team
  end

  test 'slug' do
    assert_equal 32, @team.slug.length
  end

  test 'to_param' do
    assert_equal @team.slug, @team.to_param
  end
end
