require 'net/http'
require 'uri'

uri = URI.parse("https://comicvine.gamespot.com/character/?api_key=29ea453895c508f6063bdf136251bde0f4d99551sort=<field_list>& field_list=<field_list>")
response = Net::HTTP.get_response(uri)

puts response.body
# response.body

