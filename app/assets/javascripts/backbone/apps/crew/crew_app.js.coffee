@PlanetExpress.module "CrewApp", (CrewApp, App, Backbone, Marionette, $, _) ->
	
	class CrewApp.Router extends Marionette.AppRouter
		console.log "123"
		appRoutes:
			"crew": "list"
	
	API =
		list: ->	
			new CrewApp.List.Controller.list()
	
	App.addInitializer ->
		console.log "222"
		new CrewApp.Router
			controller: API
