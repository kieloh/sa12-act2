require 'httparty'
require 'json'

def repos
  response = HTTParty.get('https://api.github.com/users/kieloh/repos')
  JSON.parse(response.body)
end

def most_stars(data)
  most = data.max_by { |repo| repo['stargazers_count']}
  {
    name: most['name'],
    description: most['description'],
    stars: most['stargazers_count'],
    url: most['html_url']
  }
end

def display(data)
  puts 'Most Stars: '
  puts "Name: #{data[:name]}"
  puts "Description: #{data[:description]}"
  puts "Stars: #{data[:stars]}"
  puts "URL: #{data[:url]}"
end

data = repos()

most = most_stars(data)
display(most)
