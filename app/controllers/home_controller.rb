class HomeController < ApplicationController
  before_filter :build_client

  def index
    @movies = @client.movies.get.content 
  end


  private

  def build_client
    @client = Viki.new(CLIENT_ID, CLIENT_SECRET)
  end
end
