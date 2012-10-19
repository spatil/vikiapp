# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready -> 
  $('#movies').carousel({ interval: 5000 })

  $('#movies').on 'click', '.thumbnail a',(event) ->
    movie =  filter_movie(this.id)

    if(movie.resource)
      movie = movie.resource
    
    if movie.formats   
      $("#show").html($("#movie_template").tmpl(movie))
    else
      alert 'Comming Soon' 

filter_movie = (id) ->
  movies.filter((x) -> 
       x if x['id'].toString() is id.toString()
  )[0]
