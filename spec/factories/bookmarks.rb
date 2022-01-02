FactoryBot.define do
  factory :bookmark do
    association :user
    association :goal
  end
end
