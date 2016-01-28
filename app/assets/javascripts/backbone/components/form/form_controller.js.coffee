@PlanetExpress.module "Components.Form", (Form, App, Backbone, Marionette, $, _) ->

  class Form.Controller extends Marionette.Controller

    initialize: (options = {}) ->
      @contentView = options.view

      @formLayout = @getFormLayout options.config

      #@formLayout.on "show", =>
      #  @formContentRegion() заменим  на 

      @listenTo @formLayout, "show", @formContentRegion 
      @listenTo @formLayout, "close", @close 
      @listenTo @formLayout, "form:submit", @formSubmit 

    formSubmit: ->
      data = Backbone.Syphon.serialize @formLayout
      console.log "111111111"
      console.log data
      if @contentView.triggerMethod("form:submit", data) isnt false
        model = @contentView.model
        console.log model
        @processFormSubmit data, model

    processFormSubmit: (data, model) ->
      console.log "processFormSubmit"
      #data.id = 5
      console.log "111111111111111111111"
      console.log model
      if model.save data 
        console.log "zzz"
      else
        console.log "xxx"

    onClose: ->
      console.log "onClose", @

    formContentRegion: ->
      @formLayout.formContentRegion.show @contentView

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