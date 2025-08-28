class BookCommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = book.id
    comment.save
    redirect_back fallback_location:book_path(book)
  end

  def destroy
    book = Book.find(params[:book_id])
    comment = book.book_comments.find(params[:id])
    if comment.user == current_user
    comment.destroy
    redirect_back fallback_location:book_path(book)
    else
    redirect_back fallback_location:book_path(book)
    end
  end

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
