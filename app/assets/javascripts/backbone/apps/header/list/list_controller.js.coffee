@PlanetExpress.module "HeaderApp.List", (List, App, Backbone, Marionette, $, _) ->

  List.Controller = 
    listH: ->
      console.log this
      listView = new List.Header#@getListHView()

      App.headerRegion.show listView
    getListHView: ->
      new List.Header


