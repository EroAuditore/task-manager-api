FactoryBot.define do
  factory :user do
    name { "Name test" }
    user_name { "User Name" }
    email { "email@test.com" }
    password { "pwd123456" }
  end
end
