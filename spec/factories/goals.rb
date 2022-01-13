FactoryBot.define do
  factory :goal do
    content { "test" }
    result { 1 }
    cause { "test" }
    improvement { "test" }
    association :user
  end
end
