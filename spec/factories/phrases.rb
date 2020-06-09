FactoryBot.define do
  factory :phrase do
    sequence(:body) { |n| "My favorite phrase #{n}" }
  end
end
