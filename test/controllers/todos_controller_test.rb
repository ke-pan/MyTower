require 'test_helper'

class TodosControllerTest < ActionController::TestCase
  setup do
    @project = create :project
    @user = create :user, name: 'Steven Curry'
    create :access, user: @user, project: @project
  end

  test 'index without auth' do
    project = create :project
    get :index, project_id: project
    assert_redirected_to root_path
  end

  test 'index' do
    access_as @user, :get, :index, project_id: @project
    assert_response :success
    assert_not_nil assigns(:todos)
  end

  test 'show' do
    @todo = create :todo, project: @project
    access_as @user, :get, :show, id: @todo, project_id: @project
    assert_response :success
    assert_not_nil assigns(:todo)
  end

  test 'create with title can be saved' do
    assert_difference('Todo.count', 1) do
      access_as @user, :post, :create, project_id: @project, todo: attributes_for(:todo)
    end
    assert_response 200
  end

  test 'create without title cant be saved' do
    assert_difference('Todo.count', 0) do
      access_as @user, :post, :create, project_id: @project,
                       todo: { title: '', description: 'description' }
    end
    assert_response 400
  end

  test 'create generate an event' do
    assert_difference('Event.count', 1) do
      access_as @user, :post, :create, project_id: @project, todo: attributes_for(:todo)
    end
  end

  test 'destroy' do
    @todo = create :todo, project: @project
    assert_difference('Todo.count', -1) do
      access_as @user, :delete, :destroy, id: @todo, project_id: @project
    end
    assert_response 204
  end

  test 'destroy generate an event' do
    @todo = create :todo, project: @project
    assert_difference('Event.count', 1) do
      access_as @user, :delete, :destroy, id: @todo, project_id: @project
    end
  end

  test 'restore' do
    todo = create :todo, project: @project
    todo.destroy
    assert_difference('Todo.count', 1) do
      access_as @user, :put, :restore, id: todo, project_id: @project
    end
  end

  test 'restore generate an event' do
    todo = create :todo, project: @project
    todo.destroy
    assert_difference('Event.count', 1) do
      access_as @user, :put, :restore, id: todo, project_id: @project
    end
  end

  test 'assign' do
    todo = create :todo, project: @project
    user = create :user
    xhr :put, :assign, id: todo, project_id: @project, user_slug: user.slug
    assert_equal user, todo.reload.assignee
  end

  test 'assign generate an event' do
    todo = create :todo, project: @project
    user = create :user
    assert_difference('Event.count', 1) do
      xhr :put, :assign, id: todo, project_id: @project, user_slug: user.slug
    end
  end

  test 'assign an assigned todo generate an event' do
    user1 = create :user, name: 'john'
    user2 = create :user, name: 'smith'
    todo = create :todo, project: @project, assignee: user1
    xhr :put, :assign, id: todo, project_id: @project, user_slug: user2.slug
    assert_equal '把 john 的任务指派给 smith', Event.last.description
  end

  test 'pause' do
    todo = create :todo, project: @project, status: 1
    xhr :put, :pause, id: todo, project_id: @project
    assert todo.reload.paused?
  end

  test 'pause generate an event' do
    todo = create :todo, project: @project, status: 1
    assert_difference('Event.count', 1) do
      xhr :put, :pause, id: todo, project_id: @project
    end
  end

  test 'finish' do
    todo = create :todo, project: @project
    xhr :put, :finish, id: todo, project_id: @project
    assert todo.reload.finished?
  end

  test 'finish generate an event' do
    todo = create :todo, project: @project, status: 1
    assert_difference('Event.count', 1) do
      xhr :put, :finish, id: todo, project_id: @project
    end
  end

  test 'run' do
    todo = create :todo, project: @project
    xhr :put, :run, id: todo, project_id: @project
    assert todo.reload.run?
  end

  test 'run generate an event' do
    todo = create :todo, project: @project
    assert_difference('Event.count', 1) do
      xhr :put, :run, id: todo, project_id: @project
    end
  end

  test 'run assign an assignee' do
    todo = create :todo, project: @project
    xhr :put, :run, id: todo, project_id: @project
    assert_not_nil todo.reload.assignee
  end

  test 'reopen' do
    todo = create :todo, project: @project, status: 2
    xhr :put, :reopen, id: todo, project_id: @project
    assert todo.reload.paused?
  end

  test 'reopen generate an event' do
    todo = create :todo, project: @project, status: 2
    assert_difference('Event.count', 1) do
      xhr :put, :reopen, id: todo, project_id: @project
    end
  end
end
