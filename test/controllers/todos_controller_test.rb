require 'test_helper'

class TodosControllerTest < ActionController::TestCase
  setup do
    @project = create :project
  end

  test 'index' do
    get :index, project_id: @project
    assert_response :success
    assert_not_nil assigns(:todos)
  end

  test 'show' do
    @todo = create :todo, project: @project
    get :show, project_id: @project, id: @todo
    assert_response :success
    assert_not_nil assigns(:todo)
  end

  test 'create with title can be saved' do
    assert_difference('Todo.count', 1) do
      post :create, project_id: @project, todo: attributes_for(:todo)
    end
    assert_response 200
  end

  test 'create without title cant be saved' do
    assert_difference('Todo.count', 0) do
      post :create, project_id: @project,
                    todo: { title: '', description: 'description' }
    end
    assert_response 400
  end

  test 'create generate an event' do
    assert_difference('Event.count', 1) do
      post :create, project_id: @project, todo: attributes_for(:todo)
    end
  end
end
