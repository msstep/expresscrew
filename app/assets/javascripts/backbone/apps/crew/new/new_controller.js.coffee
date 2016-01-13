@PlanetExpress.module "CrewApp.New", (New, App, Backbone, Marionette, $, _) ->


  New.Controller = 

    newCrew: ->
      newView = new New.Crew

      newView