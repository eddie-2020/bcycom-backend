FactoryBot.define do
  factory :user do
    photo { '12345.png' }
    username { 'Tony' }
    email { 'tony@gmail.com' }
  end
end
