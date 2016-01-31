@PlanetExpress.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
	
	class Entities.Model extends Backbone.Model

   destroy: (options = {}) ->
     _.defaults options,
       wait: true

     @set _destroy: true
     super options

   isDestroyed: ->
     @get "_destroy"

		 save: (data, options = {}) ->
     isNew = @isNew()
		   _.defaults options, 
		     wait: true
		     success: _.bind(@saveSucces, @, isNew, options.collection)
		     error:		_.bind(@saveError, @)

     @unset "_errors"
		   super data, options

		 saveSucces: (isNew, collection) => #(model, response, options) =>
		   # console.log "saveSucces"
		   # console.info "succes", @, response, options
		   if isNew # model is being created
		   	 collection.add @ if collection
		   	 collection.trigger "model:created", @ if collection 
		     @trigger "created", @
		   else # model is being updated
		   	 collection ?= @collection
		   	 collection.trigger "model:updated", @ if collection
		   	 @trigger "updated", @

		 saveError: (model, xhr, options) =>
			## set errors directly on the model unless status returned was 500 or 404
			  console.warn xhr, model
			  @set _errors: $.parseJSON(xhr.responseText)?.errors unless xhr.status is 500 or xhr.status is 404  	 
			  console.log 333333333
			  console.log xhr.responseText

		         