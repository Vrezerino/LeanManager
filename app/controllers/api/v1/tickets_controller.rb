module Api
  module V1
    class TicketsController < ApplicationController
      def index
        @tickets = Asset.all
        render json: TicketSerializer.new(@tickets, options).serialized_json
      end

      def show
        @ticket = Ticket.find_by(id: params[:id])
        render json: TicketSerializer.new(@ticket, options).serialized_json
      end

      def create
        @ticket = Ticket.new(ticket_params)

        if @ticket.save
          render json: TicketSerializer.new(@ticket).serialized_json
        else
          render json: { error: @ticket.errors.messages }, status: 422
        end
      end

      def destroy
        @ticket = Ticket.find_by(id: params[:id])

        if @ticket.destroy
          head :no_content
        else
          render json: { error: @ticket.errors.messages }, status: 422
        end
      end

      private

      def ticket_params
        params.require(:ticket).permit(:title, :description, :urgency)
      end

      def options
        @options ||= { include: %i[asset inventory_user] }
      end
    end
  end
end
