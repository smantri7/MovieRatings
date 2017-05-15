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

	def createMovie
  		@movie = Movie.new params[:movie]
  		if @movie.save
    		flash[:notice] = "#{@movie.title} saved."
    		redirect_to @movie
  		else
    		render :new
  		end
	end

  	def comment_params
    	params.require(:movie).permit(:title, :thoughts)
  	end


	def edit
	  @movie = Movie.find_by(params[:id])
	end
 
	def update
  		@movie = Movie.find_by(params[:id])
  		if @movie.update_attributes(movie_params)
    		flash[:notice] = "#{@movie.title} saved."
    		redirect_to @movie
  		else
    		render :edit
  		end
	end
 
	def destroy
  		movie = Movie.find_by(params[:id])
  		movie.destroy
  		flash[:notice] = "#{movie.title} deleted."
  		redirect_to movies_path
	end

  def movie_params
      params.require(:movie).permit(:title, :thoughts)
  end
end
