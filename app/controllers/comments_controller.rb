class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment].permit(:commenter, :body))
    redirect_to post_path(@post)
    # @user = User.find(params[:username])
  end
end
