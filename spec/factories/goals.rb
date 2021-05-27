FactoryBot.define do
  factory :goal do
    content {"test"}
    result {"未達成"}
    cause {"test"}
    improvement {"test"}
    association :user
  end
end
