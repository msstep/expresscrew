@PlanetExpress.module "Entities", (Entities, App, Backbone, Marionette, $, _)	->

		App.commands.setHandler "when:fetched", (entities, callback) ->
		  xhrs = _.chain([entities]).flatten().pluck("_fetch").value() # это аналогично заккоментаренному ниже
		  
		  # if _.isArray(entities)
		  #   xhrs.push(entity._fetch) for entity in entities
		  # else
		  #   xhrs.push(entity._fetch)  
		  
		  $.when(xhrs...).done ->
		    callback()