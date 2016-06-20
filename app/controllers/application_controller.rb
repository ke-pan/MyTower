class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @user ||= User.first || User.create(name: 'John Doe', password: 'abcdef')
  end

  def generate_event(project, description, resource, subresource = nil)
    resource_path = project_resource_path(project, resource)
    subresource_path = subresource_path(resource_path, subresource)
    current_user.events.create team_id: project.team_id,
                               project_name: project.name,
                               project_path: project_path(project),
                               resource_name: resource.try(:name) || resource.try(:title),
                               resource_path: resource_path,
                               subresource: subresource.try(:content),
                               subresource_path: subresource_path,
                               description: description,
                               user_name: current_user.name,
                               user_path: user_path(current_user)
  end

  def project_resource_path(project, resource)
    @resource_path ||= url_for controller: resource.class.to_s.underscore.pluralize,
                               action: :show,
                               id: resource,
                               project_id: project,
                               only_path: true
  end

  def subresource_path(base_path, subresource)
    return nil unless subresource
    base_path + '#' + subresource.to_param
  end
end
