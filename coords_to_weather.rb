require 'open-uri'
require 'json'

puts "Let's get the weather forecast for your location."

puts "What is the latitude?"
the_latitude = gets.chomp
# the_latitude = 41.78


puts "What is the longitude?"
the_longitude = gets.chomp
# the_longitude = -87.59

url_of_data_we_want = "https://api.forecast.io/forecast/fbd7471ca1c0c6d188c8711dab2a54ce/#{the_latitude},#{the_longitude}"
raw_data = open(url_of_data_we_want).read
parsed_data =JSON.parse(raw_data)

the_temperature  = parsed_data["currently"]["temperature"]
the_hour_outlook = parsed_data["hourly"]["data"][0]["summary"]
the_day_outlook  = parsed_data["daily"]["data"][0]["summary"]

# Ultimately, we want the following line to work when uncommented:
puts "The current temperature at #{the_latitude}, #{the_longitude} is #{the_temperature} degrees."
puts "The outlook for the next hour is: #{the_hour_outlook}"
puts "The outlook for the next day is: #{the_day_outlook}"
