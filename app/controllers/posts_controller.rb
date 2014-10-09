class PostsController < ApplicationController
  def show
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    @new_comment = Comment.new
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
    authorize @post
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = current_user.posts.build(post_params)
    @post.topic = @topic
    authorize @post

    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to [@topic, @post]
    else
      
      render :new
    end
  end

   def update
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post

    if @post.update_attributes(post_params)      
      redirect_to [@topic, @post]
    else
      
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :post_image)
  end
end