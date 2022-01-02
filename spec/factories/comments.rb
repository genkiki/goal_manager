FactoryBot.define do
  factory :comment do
    association :user
    association :goal
    comment "MyText"
  end
end
