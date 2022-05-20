class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.find(params[:bookmark_id])
    #@review = Review.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    # @movie = Movie.find(params[:movie])
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    # @bookmark.movie = @movie
    @bookmark.save!
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
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
