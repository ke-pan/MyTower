class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy]

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
end
