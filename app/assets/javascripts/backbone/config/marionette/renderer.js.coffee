do (Marionette) ->
	_.extend Marionette.Renderer,
		
		render: (template, data) ->
			path = JST["backbone/apps/" + template]#@getTemplate(template)
			console.log "99999"
			throw "Template #{template} not found!" unless path
			path(data)
		
		getTemplate: (template) ->
			for path in [template, template.split("/").insertAt(-1, "templates").join("/")]
				return JST[@root + path] if JST[@root + path]