FactoryGirl.define do
  factory :chat_room do
    title "MyString"
    association :user, factory: :user
  end
end
