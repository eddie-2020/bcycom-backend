FactoryBot.define do
  factory :motorcycle do
    model { 'MyString' }
    description { 'MyString' }
    price { 1.5 }
    image { 'MyString' }
    duration { 1 }
    discount { 1 }
    user { nil }
  end
end
