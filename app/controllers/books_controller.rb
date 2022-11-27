class BooksController < ApplicationController
before_action :correct_user, only: [:edit, :update]

 def index
  @books = Book.all
  @book = Book.new
 end

 def create
  @book = Book.new(book_params)
  @book.user_id = current_user.id
  if @book.save
   flash[:notice] = "You have created book successfully."
   redirect_to book_path(@book.id)
   flash[:notice] = "successfully"
  else
   @books = Book.all
   flash[:alret] = "Error"
   render :'books/index'
  end
 end

 def show
  @book = Book.find(params[:id])
  @books = Book.all
  @user = @book.user
  @book_new = Book.new
 end

 def edit
  @books = Book.all
  @book = Book.find(params[:id])
 end

  def update
  @book = Book.find(params[:id])
  @book.update(book_params)
  #redirect_to book_path(@book.id)
   if @book.save
   flash[:notice] = "You have updated book successfully."
   redirect_to book_path(@book.id)
   flash[:notice] = "successfully"
   else
   @books = Book.all
   flash[:alret] = "Error"
   render :'books/edit'
   end
  end

 def destroy
  @book = Book.find(params[:id])
  if @book.destroy
  redirect_to books_path
  end
 end

 private
 def book_params
 params.require(:book).permit(:title,:body)
 end

 def correct_user
  @book = Book.find(params[:id])
  @user = @book.user
  redirect_to(books_path) unless @user == current_user
 end
end
