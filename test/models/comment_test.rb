require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test 'slug' do
    comment = create :comment
    assert_equal 32, comment.slug.length
  end
end
