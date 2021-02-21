FactoryBot.define do
  factory :task do
    title { "task from require spec" }
    description { Faker::Lorem.paragraph }
  end
end
