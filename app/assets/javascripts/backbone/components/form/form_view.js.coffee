@PlanetExpress.module "Components.Form", (Form, App, Backbone, Marionette, $, _) ->

  class Form.FormWrapper extends App.Views.Layout
    template: "form/form"

    tagName: "form"
    attributes: ->
      "data-type": @getFormDataType()

    regions: 
      formContentRegion: "#form-content-region"

    ui:
      buttonContainer: "ul.inline-list"  

    triggers:
      "submit"                            : "form:submit"
      "click [data-form-button='cancel']" : "form:cancel"  

    modelEvents:
      "change:_errors" : "changeErrors"
      "sync:start"     : "syncStart"
      "sync:stop"      : "syncStop"

    initialize: -> 
      @setInstancePropertiesFor "config", "buttons"



    serializeData: ->
      footer: @config.footer
      buttons: @buttons?.toJSON() ? false

    onShow: ->
      _.defer => 
        @focusFirstInput() if @config.focusFirstInput
        @buttonPlacement() if @buttons

    buttonPlacement: ->
      @ui.buttonContainer.addClass @buttons.placement

    focusFirstInput: ->
      @$(":input:visible:enabled:first").focus() 

    getFormDataType: ->
      if @model.isNew() then "new" else "edit"

    changeErrors: (model, errors, options) ->
      if @config.errors  
        if _.isEmpty(errors) then @removeErrors() else @addErrors errors

    removeErrors: ->
      @$("error").removeClass("error").find("small").remove()# не работает как надо пока пропустим

    addErrors: (errors = {}) ->
      for name, array of errors
        @addError name, array[0]

    addError: (name, error) ->
      el = @$("[name='#{name}']")
      sm = $("<small>").text(error)
      el.after(sm).closest(".row").addClass("error")

    syncStart: (model) ->
      #@$el.addClass("opacity") if @config.syncing
      @addOpacityWrapper() if @config.syncing

    syncStop: (model) ->
      #@$el.removeClass("opacity") if @config.syncing
      @addOpacityWrapper(false)  if @config.syncing