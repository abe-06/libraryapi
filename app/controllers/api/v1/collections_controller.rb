module Api
  module V1
    class CollectionsController < ApplicationController

      def show
        books = Book.where(["collection = ?", "#{params[:collection]}"])
        render json: {status: 'SUCCESS', message:'Loaded Collection', data:books}, status: :ok
      end

      private

      def book_params
        params.permit(:collection)
      end

    end
  end
end