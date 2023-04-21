class UsersController < ApplicationController
   # before_action :authorize_request, except: :create
    before_action :find_user, except: %i[create index]

    protect_from_forgery with: :null_session

  skip_before_action :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }
  
    # GET /users
    def index
      byebug
      @users = User.all
     # render json: @users, status: :ok
      render json: {userinfo: {@users=> @users}}, status: :ok
    end
  
    # GET /users/{username}
    def show
      render json: @user, status: :ok
    end


    def edit
      #/users/:_username/edit
    end
  
    # POST /users
    def create
      @user = User.new(user_params)
      if @user.save
        render json: {user_info: {@user=> @user}}, status: :created
      else
        render json: { errors: @user.errors.full_messages },
               status: :unprocessable_entity
      end
    end

    #/users/:_username/edit
    def edit
      @user = User.find(params[:id])
    end
  
    # PUT /users/{username}
    def update
       @user = User.find(params[:id])
      if @user.update(user_params)
        render json: { errors: @user.errors.full_messages },
               status: :unprocessable_entity
      end
    end
  
    # DELETE /users/{username}
    def destroy
      @user.destroy
    end
  
    private
  
    def find_user
      @user = User.find_by_username!(params[:_username])
      rescue ActiveRecord::RecordNotFound
        render json: { errors: 'User not found' }, status: :not_found
    end
  
    def user_params
      params.permit(
         :name, :username, :email, :password, :password_confirmation
      )
    end
end