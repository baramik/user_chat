class Degreave::PageObjects::Base
	def initialize(page)
		@page = page
		# @mechanize_client = Mechanize.new
	end 

	# def page
	# 	mechanize_client.get(base_url)
	# end

	private 

	attr_reader :page
end 