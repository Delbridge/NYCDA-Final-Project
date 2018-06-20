class ApplicationController < ActionController::Base

	require 'marvel_api'

	def search
		@client = Marvel::Client.new
		@client.configure do |config|
		  config.api_key = ENV['MARVEL_PUBLIC_KEY']
		  config.private_key = ENV['MARVEL_PRIVATE_KEY']
		end
		def search_character(input)
			returned_characters = []
			f_letter = input[0]
			all_ch = JSON.parse(@client.characters(nameStartsWith: f_letter, limit:90).to_json)
			all_ch.each do |character|
				if character["name"].downcase.include?(input.downcase)
					ch_object = {}
					ch_object["name"] = character["name"]
					appearances = character["comics"]["items"]
					titles = []
					appearances.each do |comic|
						if comic["name"].split(" (")[1].split(")")[0].to_i > 2000 && titles.include?(comic["name"].split(" (")[0]) == false
							titles.push(comic["name"].split(" (")[0])
						end
					end
					ch_object["title"] = titles
					ch_object["image"] = character["thumbnail"]["path"] + "." + character["thumbnail"]["extension"]
					ch_object["description"] = character["description"]
					returned_characters.push(ch_object)
				end
			end
			return returned_characters
		end
		session[:search_results] = search_character([:params])
		redirect_to 'favorites#new'
	end

end