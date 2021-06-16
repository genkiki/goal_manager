FactoryBot.define do
  factory :task do
    goal_id { 1 }
    user_id { 1 }
    content { "MyString" }
    action { "MyText" }
    start_date { "2021-01-01 00:00:00" }
    end_date { "2021-01-01 00:00:00" }
    status { "MyText" }
    association :goal
    association :user
  end
end
