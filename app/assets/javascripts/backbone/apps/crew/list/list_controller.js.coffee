@PlanetExpress.module "CrewApp.List", (List, App, Backbone, Marionette, $, _) ->

  List.Controller = 

    list: ->
      listView = @getListView()
      console.log "888"
      App.mainRegion.show listView

    getListView: ->
      new List.Crew 