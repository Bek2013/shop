class CommentsController < ApplicationController
  def create
    comment = Comment.new params[:comment].permit(:message, :item_id)
    comment.save
    redirect_to comment.item

  end
  def destroy
    comment = Comment.find params[:id]  #Найти
    comment.destroy
    redirect_to comment.item, notice: 'Comment deleted' #Вернуться в список
  end
end
