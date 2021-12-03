FactoryBot.define do
  factory :user do
    name { "Test" }
    email { "tester@example.com" }
    password { "testtest" }
    introduce { "test" }
    after(:build) do |user|
      user.image = Rack::Test::UploadedFile.new('spec/support/test_image.jpg', 'image/jpg')
    end
  end
end
