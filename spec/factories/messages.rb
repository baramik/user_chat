FactoryGirl.define do
  factory :message do
    body FFaker::Lorem.phrase
    association :user, factory: :user
    association :chat_room, factory: :chat_room
  end
end
