@PlanetExpress.module "CrewApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Base

    initialize: ->
      window.c = @
      crew = App.request "crew:entities"

      App.execute "when:fetched", crew, =>
        @layout = 
          new List.Layout
            collection: crew

        #@listenTo @layout, "close", @close

        @listenTo @layout, "show", =>
          # @i = 0
          # while @i<5 do
          #   #panelView = new List.Panel
          #   @i +=1
          # end  
          
          # for i in 1..6
          #   do console.log "1"

          titleView = new List.Title
          @layout.titleRegion.show titleView

          panelView = new List.Panel
          
          @listenTo panelView, "new:crew:button:clicked", =>
            newView = App.request "new:crew:member:view"

            # newView.on "form:cancel:button:clicked", =>
            #   @layout.newRegion.empty() # в уроке метод close()
            @listenTo newView, "form:cancel", =>
              @layout.newRegion.empty() # в уроке метод close()


            @layout.newRegion.show newView          

          @layout.panelRegion.show panelView
          
          #newView = new List.New
          #newView = App.request "new:crew:member:view"
          #@layout.newRegion.show newView
          
          crewView = 
            new List.Crew
              collection: crew

          @listenTo crewView, "childview:crew:member:clicked", (child, args) ->
            App.vent.trigger "crew:member:clicked", args.model

          @listenTo crewView, "childview:crew:delete:clicked", (child, args) ->
            model = args.model
            if confirm "Are you sure you want to delete #{model.get("name")}?" then model.destroy() else false

          @layout.crewRegion.show crewView

        @show @layout

    getListView: ->
      new List.Crew     

    onClose: ->
      console.info "closing controller!"    