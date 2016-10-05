$(document).on 'turbolinks:load', ->
  $('#dd').on 'click', ->
    $.ajax {
      type: 'POST'
      url: '/coordinates'
      dataType: 'json'
      data: {
        coordinate: {
          latitude: 28.8
          longitude: -63.783
          time: new Date().toISOString()
        }
      }
      success: (msg) ->
        console.log msg
      error: ->
        console.log 'Error'
    }
