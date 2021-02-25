class BookmarksController < ApplicationController
  def new
    @list = List.find params[:list_id]
    @bookmark = Bookmark.new # needed to instantiate the form_for
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])

    # associate the review with the list
    @bookmark.list = @list

    if @bookmark.save
      # no need for app/views/bookmarks/create.html.erb
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end


  def destroy
    @bookmark.destroy
    redirect_to bookmarks_url, notice: 'Bookmark was successfully destroyed.'
  end
end
