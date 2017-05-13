class CommetsController < ApplicationController
	def create
		movie = Movie.find_by(params[:id])
		commet = Commet.new(comment_params) 
    	movie.commets.push(commet)
    	commet.save
    	flash[:notice] = 'Comment saved'
    	redirect_to movie_path(movie)    
	end
	def comment_params
    	params.require(:commet).permit(:text, :author,:movie)
  	end
end
