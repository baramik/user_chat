require 'rails_helper'

RSpec.describe Degreave::Converter do
  let(:message) { 'I am talking to you my little friend' }
  let(:user) { FactoryGirl.create(:user) }
  let(:dialect) { user.dialect }
  let(:converter) { described_class.new(dialect, message) }

  it 'should convert message body to selected dialect' do
    VCR.use_cassette('degreave/converted_message') do
      converted_message = converter.convert_message
      expect(converted_message).to eq("\n Talking to you my little friend, i am ")
    end
  end
end
