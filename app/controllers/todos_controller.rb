class TodosController < ApplicationController
  def index
    @todos = project.todos
  end

  def show
    @todo = project.todos.friendly.find(params[:id])
  end

  def create
    @todo = project.todos.new(todo_params)
    if @todo.save
      head 200
    else
      head 400
    end
  end

  def update
  end

  def destroy
  end

  def restore
  end

  private

  def project
    @project ||= Project.friendly.find(params[:project_id])
  end

  def todo_params
    params.require(:todo).permit(:title, :description)
  end
end
