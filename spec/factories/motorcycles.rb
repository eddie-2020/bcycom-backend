FactoryBot.define do
  factory :motorcycle do
    title { 'MyString' }
    model { 'MyString' }
    description { 'MyString' }
    price { 1.5 }
    cylinder { 2 }
    acceleration { 'MyString' }
    images { 'MyString' }
    duration { 1 }
    discount { 1 }
    user { nil }
  end
end
