FactoryBot.define do
  factory :task do
    title { Faker::Name}
    description { Faker::Lorem.paragraph }
  end
end
