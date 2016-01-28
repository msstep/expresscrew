@PlanetExpress.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
	
	class Entities.Model extends Backbone.Model

		 save: (data, options = {}) ->
     isNew = @isNew()
     console.log "222222222222"
		   _.defaults options, 
		     wait: true
		     succes: _.bind(@saveSucces, @, isNew)
		     error:		_.bind(@saveError, @)

		   super data, options

		 saveSucces: (isNew) =>
		   console.info "succes", @, isNew
		   if isNew # model is being created
		     @trigger "created", @
		   else # model is being updated
		   	 @trigger "updated", @

		 saveError: (model, xhr, options) =>
			## set errors directly on the model unless status returned was 500 or 404
			#@set _errors: $.parseJSON(xhr.responseText)?.errors unless xhr.status is 500 or xhr.status is 404  	 
			  console.log 333333333
			  console.log xhr.responseText

		         