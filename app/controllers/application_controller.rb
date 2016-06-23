class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def current_user
    @current_user ||= User.first || User.create(name: 'John Doe', password: 'abcdef')
  end

  def current_user=(current_user)
    @current_user = current_user
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
