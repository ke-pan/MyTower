FactoryGirl.define do
  factory :event do
    transient do
      project nil
      resource nil
      user nil
      comment nil
    end
    project_name {project.try(:name) || "project 1"}
    project_path {"/projects/" + (project.try(:to_param) || "abcd")}
    resource_name {resource.try(:title) || resource.try(:name) || "todo 1"}
    resource_path {project_path + "/todos/" + (resource.try(:to_param) || "abcd")}
    description "完成了任务"
    user_name {user.try(:name) || "Jone Doe"}
    user_path {"/members/" + (user.try(:to_param) || "abcd")}
    subresource {comment.content if comment}
    subresource_path {resource_path + '#' + comment.try(:to_param) if comment}
    team nil
  end
end
