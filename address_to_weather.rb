require 'open-uri'
require 'json'

puts "Let's get the weather forecast for your address."

puts "What is the address you would like to know the weather for?"
the_address = gets.chomp
# the_address = "5807 S Woodlawn Ave"

url_safe_address = URI.encode(the_address)

# Get coordinates from address
url_of_data_we_want = "http://maps.googleapis.com/maps/api/geocode/json?address=#{url_safe_address}"
raw_data = open(url_of_data_we_want).read
parsed_data =JSON.parse(raw_data)
the_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]
the_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

# Get weather from coordinates
url_of_data_we_want = "https://api.forecast.io/forecast/fbd7471ca1c0c6d188c8711dab2a54ce/#{the_latitude},#{the_longitude}"
raw_data = open(url_of_data_we_want).read
parsed_data =JSON.parse(raw_data)

the_temperature  = parsed_data["currently"]["temperature"]
the_hour_outlook = parsed_data["hourly"]["data"][1]["summary"]
the_day_outlook  = parsed_data["daily"]["data"][1]["summary"]

# Ultimately, we want the following line to work when uncommented:
puts "The current temperature at #{the_address} is #{the_temperature} degrees."
puts "The outlook for the next hour is: #{the_hour_outlook}"
puts "The outlook for the next day is: #{the_day_outlook}"
