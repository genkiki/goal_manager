FactoryBot.define do
  factory :notification do
    visitor_id 1
    visited_id 1
    goal_id 1
    comment_id 1
    action "MyString"
    check false
  end
end
