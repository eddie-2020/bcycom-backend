FactoryBot.define do
  factory :motorcycle do
    title { 'MyString' }
    model { 'MyString' }
    description { 'MyString' }
    cylinder { 1 }
    acceleration { 'MyString' }
    images { 'MyString' }
    price { 1 }
    duration { 1 }
    discount { 1 }

    association :user, factory: :user
  end
end
