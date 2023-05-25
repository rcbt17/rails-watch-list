class BookmarksController < ApplicationController
  def new
    @movie = Movie.find(params[:movie_id])
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new

  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    movie = Movie.find(params[:bookmark][:movie_id])
    list = List.find(params[:bookmark][:list_id])
    @bookmark.movie = movie
    @bookmark.list = list
    if @bookmark.save
      redirect_to list_path(list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    bookmark = Bookmark.find(params[:id])
    list = bookmark.list
    bookmark.destroy!
    redirect_to list_path(list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end

end
