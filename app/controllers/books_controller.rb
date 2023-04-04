class BooksController < ApplicationController
  
  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "create successfully"
      redirect_to "/books/#{@book.id}"
    else
      @books = Book.all
      render:index
    end
  end
  
  def index
    @books = Book.all #.order(created_at: :desc)
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
     @book = Book.find(params[:id])
  end
  
  def update
     @book = Book.find(params[:id])
     if @book.update(book_params)
       flash[:notice] = "update successfully"
       redirect_to "/books/#{@book.id}"
     else
       render:edit
     end
  end
  
  def destroy
    book = Book.find(params[:id])
    if book.destroy
      flash[:notice] = "destroy successfully"
      redirect_to "/books"
    end
  end
  
  private
  def book_params
    params.require(:book).permit(:title,:body)
  end

end