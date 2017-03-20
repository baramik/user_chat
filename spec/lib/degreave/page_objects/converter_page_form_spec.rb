require 'rails_helper'

RSpec.describe Degreave::PageObjects::ConverterPageForm do
  let(:message) { 'I am talking to you my little friend' }
  let(:user) { FactoryGirl.create(:user) }
  let(:dialect) { user.dialect }
  let(:mechanize_client) { Mechanize.new }
  let(:converter_page_url) { 'http://www.degraeve.com/translator.php' }
  let(:mechanize_converter_page) { VCR.use_cassette('degreave/converter_page') { mechanize_client.get(converter_page_url) }}

  context '#converter_form' do
    it { expect(described_class.new(mechanize_converter_page)).to respond_to(:converter_form) }
  end

  context '#translate_words_field=' do
    it { expect(described_class.new(mechanize_converter_page)).to respond_to(:translate_words_field=) }
  end
  context '#translation_type=' do
    it { expect(described_class.new(mechanize_converter_page)).to respond_to(:translation_type=) }
  end
  context '#submit' do
    it { expect(described_class.new(mechanize_converter_page)).to respond_to(:submit) }
  end
end
