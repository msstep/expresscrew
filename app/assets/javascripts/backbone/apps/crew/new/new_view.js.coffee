@PlanetExpress.module "CrewApp.New", (New, App, Backbone, Marionette, $, _) ->

  class New.Crew extends App.Views.ItemView
    template: "crew/new/templates/new_crew"

    # triggers: 
    #   "click [data-form-button='cancel']" : "form:cancel:button:clicked"

    form: 
      buttons:
        placement: "left"