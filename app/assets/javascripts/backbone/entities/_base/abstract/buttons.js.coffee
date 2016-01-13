@PlanetExpress.module "Entities", (Entities, App, Backbone, Marionette, $, _)	->

  class Entities.Button extends Entities.Model

  class Entities.ButtonsCollection extends Entities.Collection 
  	 model: Entities.Button