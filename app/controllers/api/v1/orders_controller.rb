module Api
  module V1
    class OrdersController < ApplicationController
      def index
        @orders = Order.all
        render json: OrderSerializer.new(@orders, options).serialized_json
      end

      def show
        @order = Order.find_by(id: params[:id])
        render json: OrderSerializer.new(@order, options).serialized_json
      end

      def create
				@order = Order.new(order_params)

        if @order.save
          render json: OrderSerializer.new(@order).serialized_json
        else
          render json: { error: @order.errors.messages }, status: 422
        end
      end

      def destroy
        @order = Order.find_by(id: params[:id])

        if @order.destroy
          head :no_content
        else
          render json: { error: @order.errors.messages }, status: 422
        end
      end

      private

      def order_params
        params.require(:order).permit(:customer :asset)
      end

      def options
        @options ||= { include: %i[assets customers] }
      end
    end
  end
end
