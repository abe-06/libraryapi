module Api
  module V1
    class BooksController < ApplicationController

      def index
        books = Book.all
        render json: {status: 'SUCCESS', message:'Loaded Books', data:books}, status: :ok
      end

      def show
        book = Book.find_by id: params[:id]
        render json: {status: 'SUCCESS', message:'Loaded Book', data:book}, status: :ok
      end

      def search_collection
        books = Book.where(["collection = ?", "#{params[:collection]}"])
        render json: {status: 'SUCCESS', message:'Loaded Collection', data:books}, status: :ok
      end

      def search_title
        books = Book.where("title like ?", "%#{params[:title]}%")
        render json: {status: 'SUCCESS', message:'Loaded Books', data:books}, status: :ok
      end

      def search_isbn
        books = Book.where("isbn like ?", "%#{params[:isbn]}%")
        render json: {status: 'SUCCESS', message:'Loaded Books', data:books}, status: :ok
      end

      def create
        book = Book.new(book_params)

        if book.save
          render json: {status: 'SUCCESS', message:'Book added to the database', data:book}, status: :ok
        else
          render json: {status: 'ERROR', message:'Book NOT added to the database', data:book.errors}, status: :unprocessable_entity
        end
      end

      def destroy
        book = Book.find_by id: params[:id]
        book.destroy
        render json: {status: 'SUCCESS', message:'Book deleted from the database', data:book}, status: :ok
      end

      def update
        book = Book.find_by id: params[:id]
        if book.update_attributes(book_params)
          render json: {status: 'SUCCESS', message:'Book information updated', data:book}, status: :ok
        else
          render json: {status: 'ERROR', message:'Book information NOT updated', data:book.errors}, status: :unprocessable_entity
        end
      end

      private

      def book_params
        params.permit(:title, :author, :genre, :price, :collection, :description, :isbn)
      end

    end
  end
end