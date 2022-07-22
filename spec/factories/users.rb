FactoryBot.define do
  factory :user do
    photo { '12345.png' }
    username { 'Tony' }
    email { 'you@gmail.com' }
  end
end
