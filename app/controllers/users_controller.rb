class UsersController < ApplicationController
before_action :authenticate_user!, except: [:top, :about]
 def index
  @book = Book.new
  @users = User.all
  @user = current_user
 end

 def show
  @book = Book.new
  @user = User.find(params[:id])
  @books = @user.books
 end

 def edit
  @user = User.find(params[:id])
  if @user == current_user
     render "edit"
  else
     redirect_to user_path(current_user.id)
  end
 end

 def update
  @user = User.find(params[:id])
  if @user.update(user_params)
  redirect_to user_path(@user.id)
  flash[:notice] = "successfully"
  else
   render :edit
  end
 end

 private
 def user_params
 params.require(:user).permit(:name, :introduction, :profile_image)
 end
end
