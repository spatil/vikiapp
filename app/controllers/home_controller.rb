class HomeController < ApplicationController
  before_filter :build_client
  respond_to :html, :js 

  def index
    case params[:type]
    when 'all'
      @movies = @client.movies.get.content
    when 'genre'
      @movies = @client.movies(genre: params[:id].to_i).get.content
      # get the name of the first genre as all the movies will have genres
      @name = @movies.empty? ? '' : @movies[0]['genres'][0]['name'] 
    else
      @movies = @client.featured.get.content 
      @genres = @client.genres(:movies).get.content
    end
  rescue Exception => e
    @movies    = [] 
    @genres    = []
  end

  private

  def build_client
    @client = Viki.new(CLIENT_ID, CLIENT_SECRET)
  end
end
