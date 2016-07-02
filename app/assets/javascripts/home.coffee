# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/




window.ready = ->

  setTimeout("mapInit()", 2000);
  return

window.mapInit=->
  $('#ymaps').html("")
  if $('#ymaps').length > 0
    try
      #console.log 1
      lat = 55.754787
      lon = 37.435214

      myMap = new (ymaps.Map)('ymaps',
        center: [
          lat
          lon
        ]
        zoom: 16)
      myPlacemark = new (ymaps.Placemark)([
        lat
        lon
      ],)

      myMap.geoObjects.add myPlacemark
    catch e
      setTimeout("mapInit()", 2000);
      #console.log 'Ошибка ' + e.name + ':' + e.message + '\n' + e.stack
  return

$(document).ready(ready)
$(document).on('page:load', ready)
