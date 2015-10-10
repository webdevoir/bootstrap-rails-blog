class Admin::CommentsController < Admin::ApplicationController
  def index
  	if params[:approved] == 'true'
  		@comments = Comment.where(status: true).order(id: :desc).page params[:page]
  	elsif params[:approved] == 'false'
  		@comments = Comment.where(status: false).order(id: :desc).page params[:page]
  	else
  		@comments = []
  	end
  end

  def update
  	@comment = Comment.find(params[:id])
  	@comment.update(status: params[:status])

    flash[:notice] = "Comment updated successfully"
  	redirect_to :back
  end

  def destroy
  	@comment = Comment.find(params[:id])
  	@comment.destroy

    flash[:notice] = "Comment deleted successfully"
  	redirect_to :back
  end
end
