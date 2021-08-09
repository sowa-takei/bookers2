class BooksController < ApplicationController
  protect_from_forgery

  def new
    @book = Book.new
  end

  # 投稿データの保存
  def create
    @book  = Book.new(book_params)
    @book .user_id = current_user.id
    @book .save
    redirect_to book_path(@book.id)
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new

  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body, :image, :caption)
  end
end