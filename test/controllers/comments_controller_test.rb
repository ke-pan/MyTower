require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  test 'create' do
    proj = create :project
    todo = create :todo, project: proj
    assert_difference('Comment.count', 1) do
      xhr :post, :create, todo_id: todo, project_id: proj, comment: attributes_for(:comment)
    end
    assert_response :success
  end

  test 'create generate and event' do
    proj = create :project
    todo = create :todo, project: proj
    assert_difference('Event.count', 1) do
      xhr :post, :create, todo_id: todo, project_id: proj, comment: attributes_for(:comment)
    end
    assert_equal project_todo_path(proj, todo, anchor: Comment.last), Event.last.subresource_path
  end

end
