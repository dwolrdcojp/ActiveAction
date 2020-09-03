class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @actionitem = Actionitem.find(params[:actionitem_id])
    @comment = @actionitem.comments.create(:commenter => current_user.email, :body => params[:comment][:body])
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
