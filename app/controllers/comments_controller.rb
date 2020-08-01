class CommentsController < ApplicationController
  def create
    @actionitem = Actionitem.find(params[:actionitem_id])
    @comment = @actionitem.comments.create(comment_params)
    redirect_to actionitem_path(@actionitem)
  end

  def destroy
    @actionitem = Actionitem.find(params[:actionitem_id])
    @comment = @actionitem.comments.find(params[:id])
    @comment.destroy
    redirect_to actionitem_path(@actionitem)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
