@PlanetExpress = do (Backbone, Marionette) ->
	
	App = new Marionette.Application
	
	App.addRegions
		headerRegion: "#header-region"
		mainRegion:		"#main-region"
		footerRegion: "#footer-region"
	
	App.rootRoute = Routes.crew_index_path()
	
	App.addInitializer ->
		console.log "1"
		console.log App.rootRoute
		App.module("HeaderApp").start()
		App.module("FooterApp").start()

	#App.on "initialize:after", ->
	App.on "start", ->	
		@startHistory()
		@navigate(@rootRoute, trigger: true) unless @getCurrentRoute()

	App