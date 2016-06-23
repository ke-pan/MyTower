class TodosController < ApplicationController
  before_action :set_and_authorize_project
  before_action :set_todo, only: [:show, :update, :destroy,
                                  :assign, :pause, :run,
                                  :finish, :reopen]

  def index
    @todos = project.todos
  end

  def show
  end

  def create
    @todo = project.todos.new(todo_params)
    if @todo.save
      generate_event(project, '创建了任务', @todo)
      head 200
    else
      head 400
    end
  end

  def update
  end

  def assign
    assignee = User.friendly.find params[:user_slug]
    return if @todo.assignee == assignee
    message = @todo.assignee ? "把 #{@todo.assignee_name} 的任务指派给 #{assignee.name}"
                             : "给 #{assignee.name}指派了任务"
    @todo.update(assignee: assignee)
    generate_event(project, message, @todo)
  end

  def pause
    @todo.paused!
    generate_event(project, "暂停处理这条任务", @todo)
  end

  def run
    @todo.update(assignee: current_user, status: Todo.statuses[:run])
    generate_event(project, "开始处理这条任务", @todo)
  end

  def finish
    @todo.finished!
    generate_event(project, "完成了任务", @todo)
  end

  def reopen
    @todo.paused!
    generate_event(project, "重新打开了任务", @todo)
  end

  def destroy
    @todo.destroy
    generate_event(project, '删除了任务', @todo)
    head :no_content
  end

  def restore
    @todo = Todo.only_deleted.friendly.find(params[:id])
    @todo.restore(recursive: true)
    generate_event(project, '恢复了任务', @todo)
  end

  private

  def project
    @project ||= Project.friendly.find(params[:project_id])
  end

  def todo_params
    params.require(:todo).permit(:title, :description)
  end

  def set_todo
    @todo = Todo.friendly.find(params[:id])
  end

  def set_and_authorize_project
    authorize project, :show?
  end
end
