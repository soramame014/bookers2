class BooksController < ApplicationController
	before_action :authenticate_user! 
	before_action :correct_user, only: [:edit, :update]


  def show
		@book = Book.find(params[:id])
		@user = @book.user
		@new_book = Book.new
  end

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
  	else
			@books = Book.all
  		render action: :index
  	end
  end

  def edit
		@book = Book.find(params[:id])


  end



  def update
  	@book = Book.find(params[:id])
  	if @book.update(book_params)
  		redirect_to @book, notice: "successfully updated book!"
  	else
			render "edit"

  	end
  end

  def destroy
  	@book = Book.find(params[:id])
  	@book.destroy
  	redirect_to books_path, notice: "successfully delete book!"
	end


  private

  def book_params
  	params.require(:book).permit(:title, :body)
  end

	def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    if current_user != @user
      redirect_to books_path
    end
  end
end