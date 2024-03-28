require 'httparty'
require 'json'

def time
  response = HTTParty.get("http://worldtimeapi.org/api/timezone/Europe/London")
  JSON.parse(response.body)
end

def current(data)
  current_time = data['datetime']

  current_time
end

def display(current_time)
  puts "The current time in Europe/London is #{current_time}"
end

data = time

now = current(data)

display(now)
