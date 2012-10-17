# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready -> 
  $('movies').carousel({
    interval: 2000
  })

  $('.thumbnail a').on 'click', (event) ->
    movie =  filter_movie(this.id)
    $('#show embed').attr('src', movie['formats']['flash_embed'])



filter_movie = (id) ->
  movies.filter((x) -> 
       x if x['id'].toString() is id.toString()
  )[0]
