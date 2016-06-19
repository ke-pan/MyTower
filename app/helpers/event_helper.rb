module EventHelper
  def generate_event(user, project, description, resource)
    user.events.create team_id: project.team_id,
                       project_name: project.name,
                       project_path: project_path(project),
                       resource_name: resource.try(:name) || resource.try(:title),
                       resource_path: resource_path(resource),
                       description: description,
                       user_name: user.name,
                       user_path: user_path(user)
  end

  def resource_path(resource)
    url_for controller: resource.class.to_s.underscore.pluralize,
            action: :show,
            id: resource,
            only_path: true
  end
end
