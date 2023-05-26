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
    @listcomment = ListComment.new
    @listcomments = ListComment.all
    @bookmarks = Bookmark.new
    @bookmarks = @list.bookmarks
  end

  def create_comment
    @listcomment = ListComment.new(listcomment_params)
    @listcomment.list = List.find(params[:id])
    if @listcomment.save
      redirect_to list_path(@listcomment.list)
    else
      @list = List.find(params[:id])
      render :show, status: :unprocessable_entity
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:name, :poster_img, :comment)
  end

  def listcomment_params
    params.require(:list_comment).permit(:content)
  end
end
