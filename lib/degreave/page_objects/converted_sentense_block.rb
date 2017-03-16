class Degreave::PageObjects::ConvertedSentenseBlock < Degreave::PageObjects::Base
	def converted_text_block
		page.search(".//blockquote/p").first
	end 

	def converted_text_block_value
		converted_text_block.text
	end 
end 
