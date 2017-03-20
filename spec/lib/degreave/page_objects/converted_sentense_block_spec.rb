require 'rails_helper'

RSpec.describe Degreave::PageObjects::ConvertedSentenseBlock do
  let(:message) { 'I am talking to you my little friend' }
  let(:user) { FactoryGirl.create(:user) }
  let(:dialect) { user.dialect }
  let(:mechanize_client) { Mechanize.new }
  let(:converter_page_url) { 'http://www.degraeve.com/translator.php' }
  let(:mechanize_converter_page) { VCR.use_cassette('degreave/converter_page') { mechanize_client.get(converter_page_url) }}
  let(:converter_page_form) { Degreave::PageObjects::ConverterPageForm.new(mechanize_converter_page) }

  before(:each) do
    VCR.insert_cassette('degreave/converted_page')
  end

  after(:each) do
    VCR.eject_cassette
  end

  it 'presents translated text' do
    converter_page_form.translate_words_field = message
    converter_page_form.translation_type = dialect
    converter_page_form.converter_form
    converted_page = converter_page_form.submit
    presenter = described_class.new(converted_page)
    expect(presenter).to respond_to(:converted_text_block_value)
    expect(presenter.converted_text_block_value).to eq("\n Talking to you my little friend, i am ")
  end

end
