class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.find(params[:bookmark_id])
    #@review = Review.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    redirect_to list_path(@list)
  end

  def destroy
    @bookmark.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to bookmarks_path, status: :see_other
  end

  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:bookmark_id])
  end

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:content, :rating)
  end
end
