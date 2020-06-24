FactoryBot.define do
  factory :comment do
    user { nil }
    phrase { nil }
    content { "MyText" }
  end
end
