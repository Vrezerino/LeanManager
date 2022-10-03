require "bcrypt"

module Api
  module V1
    class CustomersController < ApplicationController
      include BCrypt

      def index
        customers = Customer.all
        render json: CustomerSerializer.new(customers, options).serialized_json
      end

      def show
        customer = Customer.find_by(id: params[:id])
        render json: CustomerSerializer.new(customer, options).serialized_json
      end

      def create
        @customer = Customer.new(customer_params)
        @customer.password = BCrypt::Password.create(params: [:password])

        if @customer.save
          render json: CustomerSerializer.new(@customer).serialized_json
        else
          render json: { error: @customer.errors.messages }, status: 422
        end
      end

      def destroy
        customer = Customer.find_by(id: params[:id])

        if customer.destroy
          head :no_content
        else
          render json: { error: customer.errors.messages }, status: 422
        end
      end

      private

      def customer_params
        params.require(:customer).permit(:name, :address, :username, :password)
      end

      def options
        @options ||= { include: %i[orders bills] }
      end
    end
  end
end
