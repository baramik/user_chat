require 'rails_helper'

RSpec.describe Message, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:chat_room) }

  context 'callbacks' do
    let(:user) { create(:user) }
    let(:chat_room) { create(:chat_room, user: user) }
    let(:message_body) { 'I am talking to you my little friend' }
    let(:message) { create(:message, body: message_body, user: user, chat_room: chat_room) }

    before do
      VCR.insert_cassette('degreave/converted_page')
      VCR.insert_cassette('degreave/converter_message')
    end

    after do
      VCR.eject_cassette
    end

    it 'converts messages before create depending on user dialect' do
      expect(message.body).to eq("\n Talking to you my little friend, i am ")
    end
  end
end
