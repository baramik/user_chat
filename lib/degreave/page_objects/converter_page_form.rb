class Degreave::PageObjects::ConverterPageForm < Degreave::PageObjects::Base

	def converter_form
		@converter_form ||= page.forms.first
	end 

	def translate_words_field=(text)
		converter_form.field_with(name: 'w').value = text
	end

	def translation_type=(value)
		converter_form.radiobuttons_with(value: value)[0].check
	end 

	def submit
		converter_form.submit
	end 

end