@PlanetExpress.module "HeaderApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Base
    listH: ->
      listView = new List.Header#@getListHView()
      @show listView


    getListHView: ->
      new List.Header


