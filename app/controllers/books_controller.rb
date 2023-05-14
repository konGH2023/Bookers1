class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def index
    @books = Book.all
  end

  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    book = Book.new(book_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    book.save
    # 4. 画面へリダイレクト先
    redirect_to 'books'
  end

  def show
     @book = Book.find(params[:id])
  end

  def edit
    # @book = Book.find(params[:id])
  end

  #def update
    #@book = Book.find(params[:id]) # 与えられたIDを持つ本を検索するためにコードを追加します。
    #if @book.update(book_params)
      #redirect_to books_path
    #else
      #render 'edit'
    #end
  #end

  #def destroy
    #@book = Book.find(params[:id]) # 与えられたIDを持つ本を検索するためにコードを追加します。
    #@book.destroy
    #redirect_to books_path
  #end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
