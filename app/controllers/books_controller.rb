class BooksController < ApplicationController
  before_action :correct_post,only: [:edit]
  protect_from_forgery

  def new
    @book = Book.new
  end

  # 投稿データの保存
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
     redirect_to book_path(@book.id), notice:"Welcome! You have signed up successfully."
    else
      @user = current_user
      @books = Book.all
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
    @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
     redirect_to book_path(@book), notice:"You have updated book successfully."
    else
     render :edit
    end
  end

  def correct_post
   @book = Book.find(params[:id])
  unless @book.user.id == current_user.id
      redirect_to books_path
  end
  end


  # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body, :image)
  end
end