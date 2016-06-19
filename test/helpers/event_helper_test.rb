require 'test_helper'

class EventHelperTest < ActionView::TestCase
  include EventHelper

  test 'resource_path' do
    project = create :project
    assert_equal project_path(project), resource_path(project)
    todo = create :todo
    assert_equal todo_path(todo), resource_path(todo)
  end

  test 'generate_event' do
    user = create :user
    project = create :project
    todo = create :todo
    event = generate_event(user, project, '创建了任务', todo)
    assert_not_nil event
    assert_equal todo.title, event.resource_name
  end
end
