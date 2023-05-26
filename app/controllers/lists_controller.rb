class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = Bookmark.new
    @bookmarks = @list.bookmarks
  end

  private

  def list_params
    params.require(:list).permit(:name, :poster_img, :comment)
  end
end
