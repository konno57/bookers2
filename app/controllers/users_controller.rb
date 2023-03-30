class UsersController < ApplicationController

  def index
    @book = Book.new
    @users = User.all
    @user = current_user
  end


  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book_new = Book.new
    @user_books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

def update
  if @user = User.find(params[:id])
     @user.update(user_params)
     flash[:notice] = "You have updated user successfully."
     redirect_to user_path(@user.id)
  else
    render 'edit'
  end
end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
