class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit]


  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def new
    @book = Book.new
  end


  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to @book
    else
      @user = current_user
      @books = Book.all
      @book_new = Book.new 
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully.."
      redirect_to @book
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to @book
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

  def correct_user
    @book = current_user.books.find_by(id: params[:id])
    redirect_to books_path if @book.nil?
  end

end
