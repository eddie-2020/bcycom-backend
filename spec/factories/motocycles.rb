FactoryBot.define do
  factory :motocycle do
    model { 'MyString' }
    description { 'MyString' }
    price { 1.5 }
    title { 'MyString' }
    image { 'MyString' }
    duration { 1 }
    discount { 1 }
    user { nil }
  end
end
