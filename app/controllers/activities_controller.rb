class ActivitiesController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }
  skip_before_action :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

   def index
    byebug
    @activity = Activity.all.uniq
     render json: {@activity=> @activity}, status: :ok
   end

   def activity_delete
     @activity = Activity.where("created_at > '#{60.days.ago}'").delete_all
   end

end
