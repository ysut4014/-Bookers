class BooksController < ApplicationController
    def index
        @books = Book.all
        @book = Book.new
        if params[:post] && parabs[:post][:title].blank?
            @book.errors.add(title, "can't be blank")
           flash[:error].present?
           flash,now[:error] = flash[:error]
        end
        
    end
    def show
        @book = Book.find(params[:id])
    end
    def new
        @book = Book.new
    end
    def create
        @book = Book.new(book_params)
       if @book.save
        redirect_to book_path(@book.id)
        flash[:notice] = "Book was successfully created."
        redirect_to book_path(@book)
        flash[:error] = "prohibited this book from being saved:"

       else
        render 'new'
        
       end
    end
    def edit
        @book = Book.find(params[:id])
    end
    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
         redirect_to book_path(@book.id)
         flash[:notice] = "Book was successfully updated."
         flash[:error] = "prohibited this book from being saved:"



        else
         render 'edit'
         flash[:notice] = "error prohibited this book from being saved:"
        end
    end
    def destroy
       @book = Book.find(params[:id])
       @book.destroy
       redirect_to books_url, notice: 'Book was successfully destroyed.'
    end
    def set_book
       @book = Book.find(params[:id])
    end

 private

    def book_params
       params.require(:book).permit(:title, :body)
    end
end    

