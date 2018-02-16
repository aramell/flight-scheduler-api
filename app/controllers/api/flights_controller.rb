class Api::FlightsController < ApplicationController
  include ActionController::MimeResponds
  def index 
    @flights = Flight.all
    respond_to do |f|
      f.json {render :json => @flights}
      # f.html
    end
  end

  def new
    @flight = Flight.new
  end
  def create
    
    @flight = Flight.create(flight_params)
    if @flight.save
    respond_to do |f|
      f.json {render :json => @flight}
     end
      else
      render json: {errors:{message: "this failed"}}
      end
  end
  def edit
    @flight = Flight.Find(:id)
  end
  def show
    set_flight
    respond_to do |f|
      f.json {render json: @flight}
    end
  end
  def update
    # binding.pry
    set_flight
    
      @flight.update(flight_params)

        respond_to do |f|
          f.json {render :json => @flight}
        end
     
  end

  def destroy
    set_flight
    @flight.delete
    respond_to do |f|
      f.json {render :json => @flight}
    end
  end

  private
  def flight_params
    params.require(:flight).permit(:time, :date, :pilot,:flightTime, :plane_id, :id, :created_at, :updated_at, :planeNumber, :squawks, :destination, :likes)
  end
  def set_flight
    @flight = Flight.find_by(:id => params[:id])
  end
end
