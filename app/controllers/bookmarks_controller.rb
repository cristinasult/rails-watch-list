class BookmarksController < ApplicationController
  before_action :load_list, only: [:new, :create]
  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to @list, notice: "Movie was successfully added."
    else
      render :new, status: :unprocessable_entity
    end
  end
  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
  def load_list
    @list = List.find(params[:list_id])
  end
end
