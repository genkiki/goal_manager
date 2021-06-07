FactoryBot.define do
  factory :task do
    goal_id { 1 }
    user_id { 1 }
    content { "MyString" }
    action { "MyText" }
    term { "MyString" }
    status { "MyText" }
    association :goal
    association :user
  end
end
