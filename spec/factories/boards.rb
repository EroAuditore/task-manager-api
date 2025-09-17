FactoryBot.define do
  factory :board do
    title { "Board Title" }
    description { "Board description" }
    user { nil }
  end
end
