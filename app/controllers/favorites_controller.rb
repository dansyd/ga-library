class FavoritesController < ApplicationController
  before_action :check_if_logged_in, :only => [:wishlist]
  before_action :check_if_admin, :only => [:wishlist]

  def wishlist
    @wishlist = Favorite.all.map do |f|
      {info: GoogleBooks.search(f.isbn).first, id: f.id}
    end
  end

  def add_to_wishlist
    Favorite.create(isbn: params[:isbn])
    Request.find(params[:id]).destroy
    flash[:message] = "added to wishlist (See me in favorites#add_to_wishlist)"
    redirect_to :back
  end

  def cancel_favorite
    Favorite.find(params[:id]).destroy
    flash[:message] = "Item cancelled (See me in favorites#cancel_favorite)"
    redirect_to :back
  end
end
