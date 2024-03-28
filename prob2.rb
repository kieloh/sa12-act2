require 'httparty'
require 'json'

def crypto
  response = HTTParty.get("https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd")
  JSON.parse(response.body)
  #puts response.code
end

def sort_cap(data)
  data.sort_by {|cryptos| - cryptos['market_cap']} #descending
end

def display(data)
  puts "The top 5 Cryptos by Market Capitalization: "
  data.first(5).each_with_index do |crypto, index|
    puts "##{index + 1}: #{crypto['name']}"

    puts "Price: $#{crypto['current_price']}"
    puts "Market Cap: $#{crypto["market_cap"]}\n"
  end
end



data = crypto

sorted = sort_cap(data)

display(sorted)
