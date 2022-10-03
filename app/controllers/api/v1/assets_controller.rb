module Api
  module V1
    class AssetsController < ApplicationController
      def index
        @assets = Asset.all
        render json: AssetSerializer.new(@assets, options).serialized_json
      end

      def show
        @asset = Asset.find_by(code: params[:code])
        render json: AssetSerializer.new(@asset, options).serialized_json
      end

      def create
        before_action :authenticate_inventory_user!
        @asset = Asset.new(asset_params)

        if @asset.save
          render json: AssetSerializer.new(@asset).serialized_json
        else
          render json: { error: @asset.errors.messages }, status: 422
        end
      end

      def destroy
        @asset = Asset.find_by(id: params[:code])

        if @asset.destroy
          head :no_content
        else
          render json: { error: @asset.errors.messages }, status: 422
        end
      end

      private

      def asset_params
        params.require(:asset).permit(:code, :name, :price, :location, :status, :category, :amount)
      end

      def options
        @options ||= { include: %i[tickets orders] }
      end
    end
  end
end
