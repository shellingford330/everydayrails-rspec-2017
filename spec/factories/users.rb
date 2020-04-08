FactoryBot.define do
  factory :user, aliases: [:owner] do
    first_name { "Joe" }
    last_name { "Tester" }
    sequence(:email) { |n| "test#{n}@example.com" }
    password { "dottle-nouveau-pavilion-tights-furze" }
  end
end
