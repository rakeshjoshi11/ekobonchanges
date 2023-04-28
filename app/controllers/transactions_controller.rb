class TransactionsController < ApplicationController
    protect_from_forgery with: :null_session
    require 'securerandom'

  #      

  def index
    @trans = Transaction.all
    render json: {user_info: {@trans=> @trans}}, status: :ok
  end                    

  def new
    @trans = Transaction.new
  end

  def create
    byebug
   @trans = Transaction.new(trans_params)
   if @trans.save!
    render json: {user_info: {@trans=> @trans}}, status: :created
   else
    render json: { errors: @user.errors.full_messages },
               status: :unprocessable_entity
  end
 end


  # def destroy
  #  @trans.destroy
  # end

  private
 def trans_params
    params.permit(:transaction_id,:project_name,:carbonoffset,:offsetamount, :partner_id )
 end
end
