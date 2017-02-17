class FavoritesController < ApplicationController

  before_action :check_if_admin, :only => [:wishlist, :add_to_wishlist, :cancel_favorite]

  def wishlist
    @wishlist = Favorite.all.map do |f|
      {info: GoogleBooks.search(f.isbn).first, id: f.id}
    end
  end

  def add_to_wishlist
    Favorite.create(isbn: params[:isbn])
    Request.find(params[:id]).destroy
    flash[:message] = "Added to wishlist"
    redirect_to :back
  end

  def cancel_favorite
    Favorite.find(params[:id]).destroy
    flash[:message] = "Item cancelled"
    redirect_to :back
  end
end
