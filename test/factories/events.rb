FactoryGirl.define do
  factory :event do
    project_name "project 1"
    project_path "projects/abcd/"
    resource_name "todo 1"
    resource_path "todos/abcd/"
    description "finish todo"
    user_name "Jone Doe"
    user_path "members/abcd/"
    user nil
    team nil
  end
end
