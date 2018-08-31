class RatingsController < ApplicationController
  def update
    @rating = current_user.ratings.find_by id: params[:id]
    @book = @rating.book
    if @rating.update_attributes score: params[:score]
      respond_to do |format|
        format.js
      end
    else
      redirect_to book_path @book
    end
  end
end
