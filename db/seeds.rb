# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'open-uri'
require 'json'

html_content = URI.open("http://tmdb.lewagon.com/movie/top_rated?language=en-US").read
movies_obj = JSON.parse(html_content)
movies_obj["results"].each do |movie|
  Movie.create(title: movie['original_title'], overview: movie['overview'], rating: movie['vote_average'], poster_url: "https://image.tmdb.org/t/p/w500#{movie['poster_path']}")
end
