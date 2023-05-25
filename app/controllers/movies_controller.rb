class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    @lists = List.all
  end
end
