class StaticPagesController < ApplicationController
  def home
    @recently_published = Book.recently_published
  end
end
