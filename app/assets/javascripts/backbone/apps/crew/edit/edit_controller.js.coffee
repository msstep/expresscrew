@PlanetExpress.module "CrewApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->
  
  Edit.Controller =

    edit: (id, crew) ->
      crew or= App.request "crew:entity", id

      crew.on "all", (e) -> console.info e
      App.execute "when:fetched", crew, =>
		      @layout = 
		        new Edit.Layout
		          model: crew

		      @layout.on "show", =>
		        editView = 
		        new Edit.Crew
		          model: crew
		        
		        formView = App.request "form:wrapper", editView#,
            #footer: true
         
		        @layout.formRegion.show formView

		      App.mainRegion.show @layout

