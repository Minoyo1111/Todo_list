FactoryBot.define do
  factory :task do
    title "task from require spec"
    description { Faker::Lorem.paragraph }
    online { true }
  end
end
