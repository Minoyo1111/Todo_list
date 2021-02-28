FactoryBot.define do
  factory :task do
    title { Faker::Games::Pokemon.name}
    description { Faker::Lorem.paragraph }
  end
end
