class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  def index
  	@events = Event.all
  end
  def show
   @event = Event.find(params[:id])

  end
  def new
  	@event= Event.new
  end

  def create

    puts "#"*60
    puts params
    puts "#"*60
  	 @event = Event.create(start_date:params[:start_date],
  	 	                     duration:params[:duration],
  	 	                     title:params[:title], 
  	 	                     description:params[:description],
  	 	                     price:params[:price], 
  	 	                     location:params[:location],
  	 	                     admin_id:(current_user.id)
  	 	                   )
   if @event.save
      flash[:success] = " 👌"
        redirect_to "/"
    else
    flash[:failed] = "🤔 Attention!!! le titre/contenu n'est pas validé. 🤓 Veillez réessayer svp!"
        render "new"
    end
  end



end




  	 	                  


  