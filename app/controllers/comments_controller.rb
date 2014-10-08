class CommentsController < ApplicationController
 
  def create
    @comment = Comment.new(comment_params)
    authorize @comment
        if @comment.save
            redirect_to @comment, notice: "Comment was saved successfully."
        else            
            render :new
        end
    end