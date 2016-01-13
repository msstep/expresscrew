do (Marionette) ->
	_.extend Marionette.Renderer,
		
  lookups: ["backbone/apps/", "backbone/components/"]

		render: (template, data) ->
   path = JST[@getTemplate(template)]#
   console.log path
			throw "Template #{template} not found!" unless path
			path(data)
		
		getTemplate: (template) ->
	 	console.log JST
			for path in [template, template.split("/").insertAt(-1, "templates").join("/")]
				console.log "aaa"
				for lookup in @lookups
					console.log "bbb"
					console.log lookup + path
				 return lookup + path if JST[lookup + path]
