class BooksController < ApplicationController
  before_action :correct_user, only: [:edit]

  def show
    @book = Book.find(params[:id])
    @booknew = Book.new
    @user = @book.user

  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    if book_params[:title] == "冒険の書"
      @book.save
      redirect_to boss_path
    else
      @book.user_id = current_user.id
      if @book.save
        redirect_to book_path(@book), notice: "You have created book successfully."
      else
        @books = Book.all
        render :index
      end
    end
  end

  def edit
    if @book.user_id == current_user
      @book = Book.find(params[:id])
      render :edit
    else
        @book.user = current_user
        render :edit
    end
  end
  


  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, notice: "successfully delete book!"
  end

  def danger
    puts "ここは危険だ。"
  end

  def notice
  end


private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def correct_user
    @book = Book.find(params[:id])
    # redirect_to user_path(current_user.id) unless params[:id] == cur÷rent_user.id
    redirect_to(books_url) unless @book.user == current_user

  end
end
