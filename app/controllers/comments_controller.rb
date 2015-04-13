class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @idea        = Idea.find params[:idea_id]
    @comment          = Comment.new(comment_params)
    @comment.user     = current_user

    @comment.idea = @idea
    if @comment.save
      redirect_to idea_path(@comment), 
                    notice: "Comment created!"
    else
      # this will render the view file show.html.erb
      # inside questions folder
      render "ideas/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
