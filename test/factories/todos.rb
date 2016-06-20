FactoryGirl.define do
  factory :todo do
    title 'todo'
    description 'this is a todo'
    deleted_at nil
    project nil
    assignee nil
  end
end
