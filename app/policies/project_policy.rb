class ProjectPolicy
  attr_reader :user, :project

  def initialize(user, project)
    @user = user
    @project = project
  end

  def show?
    user.project_ids.include? project.id
  end

  def destroy?
    user.own(project)
  end
end
