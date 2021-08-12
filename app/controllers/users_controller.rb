class UsersController < ApplicationController
  before_action :correct_post,only: [:edit]
  protect_from_forgery

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
   @users = User.all
   @book = Book.new
   @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
     redirect_to user_path(@user), notice:"You have updated book successfully."
    else
      render :edit
    end
  end


  def correct_post
        @user = User.find(params[:id])
  unless @user.id == current_user.id
      redirect_to user_path(current_user)
  end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end