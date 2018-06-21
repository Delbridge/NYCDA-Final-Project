module FavoritesHelper

def find_comics(input)
	all_titles = []
	input.each do |character|
		all_titles.push(character["title"])
	end
	return all_titles
end

end
