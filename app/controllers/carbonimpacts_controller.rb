class CarbonimpactsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :verify_authenticity_token
  
   def total_impact
        params[:fuel_type].present?
        if params[:fuel_type] == "\"petrol\""
          a = (108.to_f * 100.to_f)
          b= a/1000
          render json: { carbonoffset: b},  status: :ok
        elsif params[:fuel_type] == "\"diesel\""
          a = (95.to_f * 200.to_f)
          b= a/1000
           render json: { carbonoffset: b},  status: :ok
        elsif   params[:fuel_type] =="\"lpg\""
          a = (67.to_f * 300.to_f)
          b= a/1000
           render json: { carbonoffset: b},  status: :ok
        elsif   params[:fuel_type] == "\"cng\""
          a = (55.to_f * 100.to_f)
          b= a/1000
           render json: { carbonoffset: b},  status: :ok
        elsif  params[:fuel_type] =="\"hybrid\""
          a = (55.to_f * 500.to_f)
          b= a/1000
           render json: { carbonoffset: b},  status: :ok
        elsif    params[:fuel_type] == "\"electric\""
          a = (55.to_f * 500.to_f)
          b= a/1000
           render json: { carbonoffset: b},  status: :ok
        else
           render json: { error: 'could not calculate '}, status: :unauthorized
        end
     params[:power_source].present?
          if  params[:power_source] == "\"renewable\"" 
              a = (100.to_f * 100.to_f)
              b= a/1000
                
          elsif "\"mix_energy\""
              a = (44.to_f * 100.to_f)
              b= a/1000

          elsif "\"coal\""
              a = (55.to_f * 200.to_f)
              b= a/1000

           end

  end
end
