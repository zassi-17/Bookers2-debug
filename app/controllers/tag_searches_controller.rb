class TagSearchesController < ApplicationController
  def search 
    @words = params[:content]
    @books = Book.where("category LIKE ?", "#{@words}")
    render "tag_searches/tagsearch_result"
  end
end

