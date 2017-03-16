class Degreave::Converter
	def initialize(translator_type, message_text)
		@translator_type = translator_type
		@message_text = message_text
	end

	def convert_message
		fill_form
		submit_converter_form
		result_page.converted_text_block_value
	end 

	private

	attr_reader :message_text, :translator_type, :converted_sentense_page

	def submit_converter_form
		@converted_sentense_page = converter_page.submit
	end 

	def fill_form
		converter_page.translate_words_field = message_text
		converter_page.translation_type = translator_type
		converter_page.converter_form
	end 

	def get_converter_page
		mechanize_client.get(converter_page_url)
	end 

	def converter_page_url
		'http://www.degraeve.com/translator.php'
	end 

	def result_page
		@result_page ||= Degreave::PageObjects::ConvertedSentenseBlock.new(converted_sentense_page)
	end 

	def converter_page
		@converter_page ||= Degreave::PageObjects::ConverterPageForm.new(get_converter_page)
	end 

	def mechanize_client
		@mechanize_client ||= Mechanize.new
	end 
end 