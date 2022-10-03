module Api
  module V1
    class UsersController < ApplicationController
      def index
        @Users = User.all
        render json: UserSerializer.new(@Users, options).serialized_json
      end

      def show
        @User = User.find_by(id: params[:id])
        render json: UserSerializer.new(@User, options).serialized_json
      end

      def create
        @User = User.new(user_params)
        @User.password = BCrypt::Password.create(params: [:password])

        if @User.save
          render json: { message: "Registration successful" }
        else
          render json: { error: @User.errors.messages }, status: 422
        end
      end

      def destroy
        @User = User.find_by(id: params[:id])

        if @User.destroy
          head :no_content
        else
          render json: { error: @User.errors.messages }, status: 422
        end
      end

      # def login
      #   @User = User.find_by_username(params[:username])
      #  if @User.password == params[:password]
      #    give_token
      #  else
      #    redirect_to home_url
      #  end
      # end

      private

      def user_params
        params.require(:user).permit(:username, :password, :email)
      end

      def options
        @options ||= { include: %i[tickets assets] }
      end
    end
  end
end
