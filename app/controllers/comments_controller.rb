class CommentsController < ApplicationController

  # def create
  #   @post = Post.find(params[:post_id])
  #   @comment = current_user.comments.new(post_id: @post.id, user_id: current_user.id, text: comment_params[:text])
  #   @comment.save
  #   @comment.post_id = @post.id
  #   @comment.update_comments_posts_counter

  #   respond_to do |format|
  #     format.html do
  #       if @comment.save
  #         flash[:success] = "Comment saved successfully"
  #         redirect_to user_post_path(current_user, @post)
  #       else
  #         flash.now[:error] = "Error: Comment could not be saved. Please try again."
  #         render :new
  #       end
  #     end
  #   end
    
  # end

  # def comment_params
  #   params.require(:comment).permit(:text)
  # end

  def create
    @post = Post.find(params[:post_id])
    @new_comment = current_user.comments.new(
      text: comment_params,
      user_id: current_user.id,
      post_id: @post.id
    )
    @new_comment.post_id = @post.id
    if @new_comment.save
      redirect_to "/users/#{@post.user_id}/posts/#{@post.id}"
    else
      flash.now[:error] = "Error: Comment could not be saved. Please try again."
    end
  end

  def comment_params
    params.require(:comment).permit(:text)[:text]
  end
end
