class TransactionsController < ApplicationController
    protect_from_forgery with: :null_session
    require 'securerandom'

  def index
    @trans = Transaction.all
  end

  def new
    @trans = Transaction.new
  end

  def create
    @trans = Transaction.new(trans_params)
     transaction_id = SecureRandom.hex
   if @trans.save
    byebug
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
    params.permit(:first_name,:last_name,:city,:country,:address,:transaction_id,:token)
 end
end
