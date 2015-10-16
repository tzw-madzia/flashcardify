#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.Flashcardify =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}

  currentView: null

  init: ->
    if @currentView?
      @currentView.undelegateEvents()
      @currentView.remove()
      @currentView = null

    $body = $('body')
    viewName = $body.data('view-controller') + $body.data('view-action')
    @currentView = new Flashcardify.Views[viewName]() if Flashcardify.Views[viewName]?

$(document).on 'ready page:load',  ->
  Flashcardify.init()
