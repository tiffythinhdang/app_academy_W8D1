class PostsController < ApplicationController
  helper_method :all_subs

  def all_subs
    Sub.all
  end
  
  def new
    @post = Post.new
  end

  def create
    # debugger
    @post = Post.new(post_params)
    @post.author_id = current_user.id 
    if @post.save
      redirect_to post_url(@post)
    else 
      flash[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def show
   @post = Post.find_by(id: params[:id])
  end

  def update
    @post = current_user.posts.find_by(id: params[:id])
    if @post.update(post_params)
      redirect_to post_url(@post)
    else 
      flash[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    sub_id = @post.subs.sample
    @post.destroy
    redirect_to sub_url(sub_id)
  end

  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end
end
