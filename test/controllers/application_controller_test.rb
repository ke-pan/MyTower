require 'test_helper'

class ApplicationControllerTest < ActionController::TestCase
  test 'project_resource_path' do
    proj = create :project
    todo = create :todo, project: proj
    assert_equal project_todo_path(proj, todo), @controller.project_resource_path(proj, todo)
  end

  test 'generate_event' do
    todo = create :todo
    proj = create :project
    event = @controller.generate_event(proj, '创建了任务', todo)
    assert_not_nil event
    assert_equal todo.title, event.resource_name
  end
end
