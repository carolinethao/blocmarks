class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new
    @bookmark.name = params[:bookmark][:name]
    @bookmark.description = params[:bookmark][:description]

    if @bookmark.save
      redirect_to @bookmark, notice: "Bookmark was saved successfully."
    else
      flash.now[:alert] = "Error creating bookmark. Please try again."
      render :new
    end
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
  end

  def update
    @bookmark = Bookmark.find(params[:id])

    @bookmark.name = params[:bookmark][:name]
    @bookmark.description = params[:bookmark][:description]

    if @bookmark.save
       flash[:notice] = "Bookmark was updated."
      redirect_to @bookmark
    else
      flash.now[:alert] = "Error saving bookmark. Please try again."
      render :edit
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])

    if @bookmark.destroy
      flash[:notice] = "\"#{@bookmark.name}\" was deleted successfully."
      redirect_to action: :index
    else
      flash.now[:alert] = "There was an error deleting the bookmark."
      render :show
    end
  end
end
