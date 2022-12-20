class BookmarksController < ApplicationController

  # En tant qu’utilisateur, je peux marquer (bookmark) un film dans une liste de films.
  def new
    @movies = Movie.all
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @movies = Movie.all
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # En tant qu’utilisateur, je peux détruire un bookmark.
  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
