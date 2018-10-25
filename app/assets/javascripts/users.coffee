# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $("a[data-remote]").on("ajax:success", (event) ->
    [data, status, xhr] = event.detail
    $('.current_address').replaceWith("<h1 class='current_address'>#{data.address}</h1>")
  ).on("ajax:error", (event) -> 
    [data, status, xhr] = event.detail
    $('.current_address').replaceWith("<h1 class='current_address'>#{data.error}</h1>")
  )