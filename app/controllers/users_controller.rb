class UsersController < ApplicationController
  def users
  end
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @new_book = Book.new
  end
  
  def edit
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end
  
  def index
    @books = Book.all
		@new_book = Book.new
		@users = User.all
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user)
    else
      render :edit
    end  
  end
    
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
  def correct_post
        @post = User.find(params[:id])
    unless @post.user.id == current_user.id
      redirect_to user_path(@post)
    end
  end
  
end
