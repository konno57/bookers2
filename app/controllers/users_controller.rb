class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    @user.update(user_params)
    redirect_to @user
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end
end
