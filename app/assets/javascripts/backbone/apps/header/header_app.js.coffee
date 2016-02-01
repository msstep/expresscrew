@PlanetExpress.module "HeaderApp", (HeaderApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false

  API =
    list: ->
      new HeaderApp.List.Controller
        region: App.headerRegion

  HeaderApp.on "start", ->
    console.log "3"
    API.list()