class CommentsController < ApplicationController
  def create
    @project = Project.friendly.find(params[:project_id])
    @todo = Todo.friendly.find(params[:todo_id])
    @comment = @todo.comments.new(comment_params)
    if @comment.save
      generate_event(@project, '回复了任务', @todo, @comment)
      render 'create'
    else
      head 400
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
