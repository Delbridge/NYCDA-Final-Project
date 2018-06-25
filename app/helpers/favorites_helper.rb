module FavoritesHelper

def new_comics_search(favorites)
	output = []
	favorites.each do |character|
		old_appearances = cleanup_array(character["title"])
		ch_obj = {}
		ch_obj["heading"] = "Based on your interest in " + character["name"] + "..."
		# ch_obj["titles"] = ["hi", "test", "whatever"]
		# ch_obj["titles"] = old_appearances
		ch_obj["titles"] = check_shortbox(old_appearances)
		output.push(ch_obj)
	end
	return output
end

def check_shortbox(archive_array)
	require 'net/http'
	require 'uri'
	require 'rubygems'
	require 'json'
	require 'date'
	uri1 = URI.parse("https://api.shortboxed.com/comics/v1/releases/available")
	dates = JSON.parse(Net::HTTP.get_response(uri1).body)["dates"]
	search_dates = []
	start_recent = dates.length - 3
	for i in start_recent...dates.length
		search_dates.push(dates[i])
	end
	# return search_dates
	all_upcoming = []
	search_dates.sort().each do |day|
		uri2 = URI.parse('https://api.shortboxed.com/comics/v1/query?release_date=' + day)
		response = JSON.parse(Net::HTTP.get_response(uri2).body)["comics"]
		if response.kind_of?(Array)
			response.each do |comic|
				all_upcoming.push([comic["title"], comic["release_date"]])
			end
		end
	end
	# return all_upcoming
	output = []
	archive_array.each do |look_for|
		all_upcoming.each do |pair|
			if pair[0].include?(look_for.upcase)
				output.push(pair)
			end
		end
	end
	return output
end

def cleanup_array(array)
	output = []
	array.each do |item|
		if item[0] == " "
			item_a = item.split("")
			item_a.delete_at(0)
			fixed = item_a.join("")
			if output.include?(fixed) == false
				output.push(fixed)
			end
		elsif output.include?(item) == false
			output.push(item)
		end
	end
	return output
end

end
