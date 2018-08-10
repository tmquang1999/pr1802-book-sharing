class BooksController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @book = current_user.books.build(book_params)
    if @book.save
      flash[:success] = "Post created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @book.destroy
    flash[:success] = "Post deleted"
    redirect_to request.refferer || root_url
  end

  private

    def book_params
      params.require(:book).permit(:name, :description, :picture)
    end

    def correct_user
      @book = current_user.books.find_by(id: params[:id])
      redirect_to root_url if @book.nil?
    end
end
