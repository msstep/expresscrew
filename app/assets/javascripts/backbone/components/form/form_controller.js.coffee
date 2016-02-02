@PlanetExpress.module "Components.Form", (Form, App, Backbone, Marionette, $, _) ->

  class Form.Controller extends App.Controllers.Base

    initialize: (options = {}) ->
      @contentView = options.view

      @formLayout = @getFormLayout options.config

      #@formLayout.on "show", =>
      #  @formContentRegion() заменим  на 

      @listenTo @formLayout, "show", @formContentRegion 

      @listenTo @formLayout, "form:submit", @formSubmit 
      @listenTo @formLayout, "form:cancel", @formCancel

    formCancel: ->
      @contentView.triggerMethod "form:cancel"

    formSubmit: ->
      data = Backbone.Syphon.serialize @formLayout
      if @contentView.triggerMethod("form:submit", data) isnt false
        model = @contentView.model
        collection = @contentView.collection
        @processFormSubmit data, model, collection

    processFormSubmit: (data, model, collection) ->
      #data.id = 5
      model.save data,
        collection: collection
        

    onClose: ->
      console.log "onClose", @

    formContentRegion: ->
      @region = @formLayout.formContentRegion
      @show @contentView
      #@formLayout.formContentRegion.show @contentView

    getFormLayout: (options = {}) ->
      config = @getDefaultConfig _.result(@contentView, "form")
      _.extend config, options
      
      buttons = @getButtons config.buttons

      new Form.FormWrapper
        config: config
        model: @contentView.model
        buttons: buttons

    getDefaultConfig: (config = {}) ->
      _.defaults config,
        footer: true
        focusFirstInput: true
        errors: true
        syncing: true
        # buttons:
        #   primary: "Save"
        #   cancel: "Cancel"
        #   placement: "right"
    #     buttons: @getDefaultButtons config.buttons

    # getDefaultButtons: (buttons = {}) ->
    #   _.defaults buttons,
    #     primary: "Save"
    #     cancel: "Cancel"
    #     placement: "right"

    getButtons: (buttons = {}) ->
      App.request("form:button:entities", buttons, @contentView.model) unless buttons is false


  App.reqres.setHandler "form:wrapper", (contentView, options = {}) ->
    throw new Error "New model inside of form's contentView" unless contentView.model
    formController = new Form.Controller
      view: contentView
      config: options
    formController.formLayout  