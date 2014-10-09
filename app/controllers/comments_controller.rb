class CommentsController < ApplicationController
 
  def create
    @post = Post.find(params[:post_id])
    @comment = current_post.comments.build(comment_params)
    @comment.post = @comment
    authorize @comment
    

    authorize @comment


        if @comment.save
      flash[:notice] = "Comment was created."
    else
      flash[:error] = "There was an error saving the comment. Please try again."
    end

    respond_with(@comment) do |f|
      f.html { redirect_to [@topic, @post] }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end