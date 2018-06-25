class ApplicationController < ActionController::Base
require 'marvel_api'
	def search
		teller = params[:input].to_s
		def search_character(input)
			returned_characters = []
			f_letter = input[0].to_s
			
			@client = Marvel::Client.new
			@client.configure do |config|
			  config.api_key = Rails.application.credentials.marvel_public_key
			  config.private_key = Rails.application.credentials.marvel_private_key
			end
			all_ch = @client.characters(nameStartsWith: f_letter.to_s, limit: 90)
			all_ch.each do |character|
				if character["name"].downcase.include?(input.downcase)
					ch_object = {}
					ch_object["name"] = character["name"]
					appearances = character["comics"]["items"]
					titles = []
					appearances.each do |comic|
						if comic["name"].split(" (")[1].split(")")[0].to_i > 2000 && titles.include?(comic["name"].split(" (")[0]) == false
							titles.push(comic["name"].split(" (")[0] + ",")
						end
					end
					ch_object["title"] = titles
					ch_object["image"] = character["thumbnail"]["path"] + "." + character["thumbnail"]["extension"]
					ch_object["description"] = character["description"]
					if returned_characters.length < 6
						returned_characters.push(ch_object)
					end
				end
			end
			return returned_characters
		end
		sender = search_character(teller)
			redirect_to favorites_display_url(search_results: sender)

		# sends an ARRAY of character OBJECTS to the FAVORITES#DISPLAY view
			# each object has a name string, description string, image string, and a title array
		# in the controller for FAVORITES#DISPLAY the array can be called as PARAMS[:SEARCH_RESULTS]

	end

	private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    favorites_landing_path
  end

end