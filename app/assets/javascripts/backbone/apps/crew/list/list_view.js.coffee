@PlanetExpress.module "CrewApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Crew extends App.Views.ItemView
    console.log "777"
    template: "crew/list/templates/crew"	