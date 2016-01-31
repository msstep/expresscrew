@PlanetExpress.module "CrewApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->
  
  Edit.Controller =

    edit: (id, crew) ->
      crew or= App.request "crew:entity", id

      crew.on "updated", ->
        App.vent.trigger "crew:updated", crew
      
      crew.on "all", (e) -> console.info e
      App.execute "when:fetched", crew, =>
		      @layout = 
		        new Edit.Layout
		          model: crew

		      @layout.on "show", =>
		        @titleRegion crew

		        editView = 
		        new Edit.Crew
		          model: crew

		        editView.on "form:cancel", ->
		          console.log "editView.on"
		          App.vent.trigger "crew:cancelled", crew  

		        formView = App.request "form:wrapper", editView#,
            #footer: true
         
		        @layout.formRegion.show formView

		      App.mainRegion.show @layout

		  titleRegion: (crew) ->
		    titleView = @getTitleView crew
		    @layout.titleRegion.show titleView

		  getTitleView: (crew) ->
		    new Edit.Title
        model: crew


