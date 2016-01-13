@PlanetExpress.module "CrewApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->
  
  Edit.Controller =

    edit: (id, crew) ->
      crew or= App.request "crew:entity", id

      #crew.on "all", (e) -> console.info e
      App.execute "when:fetched", crew, =>
        console.log "e1"
		      @layout = 
		        new Edit.Layout
		          model: crew

		      @layout.on "show", =>
		        editView = 
		        new Edit.Crew
		          model: crew
          console.log "e2"
		        formView = App.request "form:wrapper", editView
          console.log "e3"
          console.log formView
		        @layout.formRegion.show formView
		        console.log "e4"
		       

		      App.mainRegion.show @layout

