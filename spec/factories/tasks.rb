FactoryBot.define do
  factory :task do
    title { "Task title" }
    description { "Task description" }
    status { "todo" }
    board { nil }
    user { nil }
  end
end
