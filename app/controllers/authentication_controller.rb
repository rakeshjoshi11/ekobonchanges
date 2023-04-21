class AuthenticationController < ApplicationController
    #before_action :authorize_request, except: :login
      protect_from_forgery unless: -> { request.format.json? }
      skip_before_action :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }
    # POST /auth/login
    def login
      @user = User.find_by_email(params[:email])
      if @user&.authenticate(params[:password])
        token = JsonWebToken.encode(user_id: @user.id)
        time = Time.now + 24.hours.to_i
        render json: { userinfo: {id:@user.id, exp: time.strftime("%m-%d-%Y %H:%M"),
                       username: @user.username, name: @user.name, email: @user.email,token: token, created_at: @user.created_at, updated_at: @user.updated_at}}, status: :ok
      else
        render json: { error: 'please enter correct pasword' }, status: :unauthorized
      end
    end

    private
  
    def login_params
      params.permit(:email, :password)
    end
end