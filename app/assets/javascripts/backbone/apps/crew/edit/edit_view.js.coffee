@PlanetExpress.module "CrewApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

  class Edit.Layout extends App.Views.Layout
    template: "crew/edit/templates/edit_layout"

    regions:
      titleRegion: "#title-region" 
      formRegion:  "#form-region"

  class Edit.Title extends App.Views.ItemView
    template: "crew/edit/edit_title"

    modelEvents:
      "updated" : "render"

  class Edit.Crew extends App.Views.ItemView
    template: "crew/edit/templates/edit_crew"

    

    # onFormSubmit: (data) ->
    #   false

    # form:
    #   footer: false

      
      #focusFirstInput: false
      #buttons: false
        #primary: "foo"
        #cancel: false
        #placement: "left"

