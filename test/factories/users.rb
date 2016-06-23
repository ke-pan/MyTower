FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "John Doe #{n}" }
    password 'abcdefg'
  end
end
