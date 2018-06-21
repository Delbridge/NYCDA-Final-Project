module FavoritesHelper

def find_comics(input)
	all_titles = []
	input.each do |character|
		character["title"].each do |comic|
			if all_titles.index(comic) == nil
				all_titles.push(comic)
			end
		end
	end
	# return all_titles
	return run_shortbox(all_titles)
end

def run_shortbox(input)
	uri1 = URI.parse("https://api.shortboxed.com/comics/v1/releases/available")
	dates = JSON.parse(Net::HTTP.get_response(uri1).body)["dates"]
	search_dates = []
	start_recent = dates.length - 2
	for i in start_recent...dates.length
		search_dates.push(dates[i])
	end
	output = []
	input.each do |look_for|
		search_dates.sort().each do |day|
			uri2 = URI.parse('https://api.shortboxed.com/comics/v1/query?title='+look_for+'&release_date=' + day)
			response = JSON.parse(Net::HTTP.get_response(uri2).body)["comics"]
			if response.kind_of?(Array)
				response.each do |comic|
					# if comic["title"].include?(look_for)
						output.push([comic["title"], comic["release_date"]])
					# end
				end
			end
		end
	end
	return output
end

end
