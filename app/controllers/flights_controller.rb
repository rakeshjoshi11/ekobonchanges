class FlightsController < ApplicationController
	protect_from_forgery with: :null_session
    before_action :verify_authenticity_token
  require 'csv'

 def country
   byebug
 	 @flight = CSV.read("/home/cti/Documents/country.csv")
 	 a = @flight.join(",")
 	 d = a.split(",")
 	 render json: {d=> d}, status: :ok
 end

 def new
   @flight = Flight.new
 end

 def create
 	byebug
 	@flight = Flight.new(flight_params)
 	if @flight.save
      render json: {@flight=> @flight}, status: :ok
 	else
 		ender json: { errors: @flight.errors.full_messages },
               status: :unprocessable_entity
 	end
 end



 private

 def flight_params
 	params.permit(:from, :to, :passenger, :class_type)
 end

end


