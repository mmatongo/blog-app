FactoryBot.define do
  factory :comment do
    user
    post
    text { 'This is a test Comment' }
  end

  factory :like do
    post
    user
  end
end
