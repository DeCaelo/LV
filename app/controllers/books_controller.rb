class BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :show]

  def search
    if params[:search].present?
      @books = Book.search(params[:search])
    else
      @books = Book.all
    end
  end

  def index
    @books = Book.all.order("id ASC").paginate(:page => params[:page], :per_page => 8)
    @partial = params[:view] || "index" || "list"
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to root_path
  end

  private

  def book_params
    params.require(:book).permit(:author, :state, :who, :release_date, :release_pocket_date, :title, :category_id, :book_img)
  end

  def find_book
    @book = Book.find(params[:id])
  end

end
