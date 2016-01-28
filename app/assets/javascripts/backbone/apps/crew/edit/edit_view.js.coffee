@PlanetExpress.module "CrewApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

  class Edit.Layout extends App.Views.Layout
    template: "crew/edit/templates/edit_layout"

    regions: 
      formRegion: "#form-region"

  class Edit.Crew extends App.Views.ItemView
    template: "crew/edit/templates/edit_crew"

    # onFormSubmit: (data) ->
    #   console.log "Edit.Crew onFormSubmit", data
    #   false

    # form:
    #   footer: false

      
      #focusFirstInput: false
      #buttons: false
        #primary: "foo"
        #cancel: false
        #placement: "left"

