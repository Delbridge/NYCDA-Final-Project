module FavoritesHelper

def find_comics(input)
	all_titles = []
	input.each do |character|
		# if all_titles.include?(character["title"]) === false
			all_titles.push(character["title"])
		# end
	end
	final_list = []
	all_titles.each do |title|
		final_list.push(run_shortbox(title))
	end
	return final_list
end

def run_shortbox(input)
	uri1 = URI.parse("https://api.shortboxed.com/comics/v1/releases/available")
	dates = JSON.parse(Net::HTTP.get_response(uri1).body)["dates"]
	search_dates = []
	start_recent = dates.length - 3
	for i in start_recent...dates.length
		search_dates.push(dates[i])
	end
	output = []
	search_dates.sort().each do |day|
		uri2 = URI.parse('https://api.shortboxed.com/comics/v1/query?title='+input.to_s+'&release_date=' + day.to_s)
		response = JSON.parse(Net::HTTP.get_response(uri2).body)["comics"]
		if response.kind_of?(Array)
			response.each do |comic|
				output.push([comic["title"], comic["release_date"]])
			end
		end
	end
	return output
end

end
