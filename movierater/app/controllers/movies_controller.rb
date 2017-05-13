class MoviesController < ApplicationController
	def index
		@movies = Movie.paginate :page => params[:page], :per_page => 10
	end
	def show
		@movie = Movie.find_by(params[:id])
		@commets = @movie.commets.paginate :page => params[:page], :per_page => 10
	end

	def create
    	@movie = Movie.new(comment_params)
    	if @movie.save
      		redirect_to new_movie_path
    	end
	end

  	def comment_params
    	params.require(:movie).permit(:title, :thoughts)
  	end
end
