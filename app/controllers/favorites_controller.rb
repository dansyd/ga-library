class FavoritesController < ApplicationController
  def wishlist
    @wishlist = Favorite.all.map do |f|
      {info: GoogleBooks.search(f.isbn).first, id: f.id}
    end
  end

  def add_to_wishlist
    Favorite.create(isbn: params[:isbn])
    Request.find(params[:id]).destroy
    redirect_to :back
  end

  def cancel_favorite
    Favorite.find(params[:id]).destroy
    redirect_to :back
  end
end
