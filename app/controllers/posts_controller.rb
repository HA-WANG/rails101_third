class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_group

  def new
    @post = @group.posts.new
  end

  def edit
    @post = @group.posts.find(params[:id])
  end

  def create
    @post = @group.posts.build(post_params)

    if @post.save
      redirect_to group_path(@group), notice: "Create success!"
    else
      render :new
    end
  end

  def update
    @post = @group.posts.find(params[:id])

    if @post.update(post_params)
      redirect_to group_path(@group), notice: "Article update success!"
    else
      render :edit
    end
  end

  def destroy
    @group = Group.find(params[:group_id])
    @post = @group.posts.find(params[:id])

    @post.destroy
    redirect_to group_path(@group), alert: "Post deleted!"
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  def find_group
    @group = Group.find(params[:group_id])
  end
end
