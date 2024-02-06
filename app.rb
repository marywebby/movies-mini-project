require "sinatra"
require "sinatra/reloader"
require 'uri'
require 'net/http'
require "http"
require 'dotenv/load'

get("/") do
  erb(:homepage)
end

get("/now-playing") do
  url = URI("https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=1")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true

  request = Net::HTTP::Get.new(url)
  request["accept"] = "application/json"
  request["Authorization"] = "Bearer #{ENV["MOVIE_DB_ACCESS_TOK"].to_s.gsub(/[\r\n]/, '')}"

  response = http.request(request)
  body = JSON.parse(response.read_body)

  @movies = body["results"] 

  erb(:now_playing)
end 

get("/trending-tv") do 
  url = URI("https://api.themoviedb.org/3/trending/tv/day?language=en-US")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true

  request = Net::HTTP::Get.new(url)
  request["accept"] = "application/json"
  request["Authorization"] = "Bearer #{ENV["MOVIE_DB_ACCESS_TOK"].to_s.gsub(/[\r\n]/, '')}"

  response = http.request(request)
  body = JSON.parse(response.read_body)

  @trending_tv = body["results"] 

  erb(:trending_tv)
end

get("/watch-list") do 
  erb(:watch_list)
end

get("/trending-people") do 
  url = URI("https://api.themoviedb.org/3/trending/person/day?language=en-US")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true

  request = Net::HTTP::Get.new(url)
  request["accept"] = "application/json"
  request["Authorization"] = "Bearer #{ENV["MOVIE_DB_ACCESS_TOK"].to_s.gsub(/[\r\n]/, '')}"

  response = http.request(request)
  body = JSON.parse(response.read_body)

  @trending_people = body["results"] 

  erb(:trending_people)
end
