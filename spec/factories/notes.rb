FactoryBot.define do
  factory :note do
    message { "Myimportant note" }
    association :project
    user { project.owner }
  end
end
