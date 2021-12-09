FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "tester#{n}" }
    sequence(:email) { |n| "tester#{n}@example.com" }
    password { "testtest" }
    introduce { "test" }
    after(:build) do |user|
      user.image = Rack::Test::UploadedFile.new('spec/support/test_image.jpg', 'image/jpg')
    end
  end
end
