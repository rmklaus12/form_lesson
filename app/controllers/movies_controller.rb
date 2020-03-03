class MoviesController < ApplicationController
  def index
      @movies = session[:movies]
  end

  def create
      if session[:movies] == nil
          session[:movies] = []
      end

      session[:movies].push(params[:movie])

      redirect_to movie_path(session[:movies].length - 1)
  end

  def new

  end

  def show
      @movie = session[:movies][params[:id].to_i - 1]
  end

  def edit
    @movie = session[:movies][params[:id].to_i - 1]
  end

  def update
    session[:movies][params[:id].to_i - 1] = params[:movie]
    redirect_to movie_path(params[:id].to_i)
  end
end


