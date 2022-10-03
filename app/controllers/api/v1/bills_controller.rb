module Api
  module V1
    class BillsController < ApplicationController
      def index
        @bills = Bill.all
        render json: BillSerializer.new(@bills, options).serialized_json
      end

      def show
        @bill = Bill.find_by(id: params[:id])
        render json: BillSerializer.new(bill, options).serialized_json
      end

      def create
        @bill = Bill.new(bill_params)

        if @bill.save
          render json: BillSerializer.new(@bill).serialized_json
        else
          render json: { error: @bill.errors.messages }, status: 422
        end
      end

      def destroy
        @bill = Bill.find_by(id: params[:id])

        if @bill.destroy
          head :no_content
        else
          render json: { error: @bill.errors.messages }, status: 422
        end
      end

      private

      def bill_params
        params.require(:bill).permit(:customer, :order, :purchase_date, :total, :po_number, :info)
      end

      def options
        @options ||= { include: %i[customer order] }
      end
    end
  end
end
