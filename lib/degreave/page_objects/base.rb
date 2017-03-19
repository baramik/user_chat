class Degreave::PageObjects::Base
	def initialize(page)
		@page = page
	end

	private 

	attr_reader :page
end 