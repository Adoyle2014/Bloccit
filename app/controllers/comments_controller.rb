class CommentsController < ApplicationController
 
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    authorize @comment
    

    if @comment.save
      flash[:notice] = "Comment was created."
      redirect_to(:back)
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      redirect_to(:back)
    end
  end

    def destroy      
      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])

      authorize @comment

      if @comment.destroy
        flash[:notice] = "Comment was removed"
        redirect_to [@post.topic, @post]
      else
        flash[:error] = "Comment couldn't be deleted, please try again."
        redirect_to [@post.topic, @post]
      end
    end    
 

 
  def comment_params
    params.require(:comment).permit(:body)
  end
end