# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->

  $('#checkbox_kurwa').on 'click', ->
    ischecked = $('#checkbox_kurwa').is(':checked')
    if ischecked
      $('.card_checkbox').prop('checked', true)
    else
      $('.card_checkbox').prop('checked', false)
