class CrewController < ApplicationController

  respond_to :json

  skip_before_action :verify_authenticity_token

  def index
  	 #sleep 5
  	 @crew = Crew.all
  end

  def show
  	 #sleep 5
  	 # console.log "123"
  	 @member = Crew.find params[:id]
  end

  def update
  	 #sleep 25
  	 @member = Crew.find params[:id]
  	 if @member.update_attributes crew_params
  	 	 render "crew/show"
  	 else
  	 	 respond_with @member
  	 end	 
  end	

  private

    def crew_params
      params.require(:crew).permit(:age, :avatar, :name, :origin, :quote, :species, :title)
    end
end  