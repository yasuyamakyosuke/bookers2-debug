class FavoritesController < ApplicationController
	def create
		book = Book.find(params[:book_id])
		favorite = current_user.favorites.new(book_id:book.id)
		unless  book.favorited_by?(current_user)
		        favorite.save
		end
		    redirect_back(fallback_location: root_path)
	end

	def destroy
		book = Book.find(params[:book_id])
		favorite = current_user.favorites.find_by(book_id:book.id)
		if  book.favorited_by?(current_user)
		        favorite.destroy
		end
		redirect_back(fallback_location: root_path)


	end
end
