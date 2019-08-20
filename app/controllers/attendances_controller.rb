class AttendancesController < ApplicationController
   before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  
    def index
      @event = Event.find(params[:event_id])
    end

	def new
     @event = Event.find(params[:event_id])
    end		 


   def create
   	@attendance= Attendance.new(stripe_customer_id:stripe_customer_id,event: @event,participant: current_user)
    @event = Event.find(params[:event_id])                  
                              
  # Amount in cents
  @amount = event.price

  customer = Stripe::Customer.create({
                                       email: params[:stripeEmail],
                                        source: params[:stripeToken ],
                                       })

  charge = Stripe::Charge.create({
                                      customer: customer.id,
                                       amount: @amount,
                                      description: 'Rails Stripe customer',
                                          currency: 'usd',
                                             })

   rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_charge_path
   end


   
    puts "#"*60
    puts params
    puts "#"*60

   if @attendance.save
   	
   	 redirect_to events_index_path(@event.id) , notice: "votre participation à l'évenement a été pris en compte"
   else 
   	redirect_to events_index_path(@event.id) , error:"votre participation à l'évenement n'a pas été pris en compte"

   end

   
end
