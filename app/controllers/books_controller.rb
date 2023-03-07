class BooksController < ApplicationController
  def index
    @books = Book.all.order(created_at: :asc)
  end

  def show
    @book = Book.find(params[:id])
    @author = @book.author
  end

  def new
    @book = Book.new
    @authors = []
    Author.all.each do |a|
      @authors.append([a.first_name + ' ' + a.last_name, a.id])
    end
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @book = Book.find(params[:id])
    @authors = []
    Author.all.each do |a|
      @authors.append([a.first_name + ' ' + a.last_name, a.id])
    end
    @author = Author.find_by(id: @book.author_id).id
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to @book
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to books_path, status: :see_other
  end

  private

  def book_params
    params.require(:book).permit(:name, :price, :author_id)
  end
end
