FactoryBot.define do
  factory :user do
    name {"Test"}
    email {"tester@example.com"}
    password {"test"}
    image {"test.jpg"}
    introduce {"test"}
  end
end
