require 'test_helper'

class ApplicationControllerTest < ActionController::TestCase
  test 'resource_path' do
    todo = create :todo
    assert_equal todo_path(todo), @controller.resource_path(todo)
  end

  test 'generate_event' do
    todo = create :todo
    proj = create :project
    event = @controller.generate_event(proj, '创建了任务', todo)
    assert_not_nil event
    assert_equal todo.title, event.resource_name
  end
end
