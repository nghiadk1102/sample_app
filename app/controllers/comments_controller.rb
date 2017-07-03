class CommentsController < ApplicationController

  def create
    @post = Post.find_by id: params[:comment][:post_id]
    @comment = Comment.find_by id: params[:comment][:comment1st_id]

    if @comment.nil?
      @comment1st = Comment.new comment_params
      @comment1st.user_id = current_user.id
      if @comment1st.save
        render json: {status: :success, level: 0,
          html: render_to_string(@comment1st)}
      else
        render json: {status: :fail}
      end
    else
      @comment2rd = Comment.new comment_params
      @comment2rd.user_id = current_user.id
      if @comment2rd.save
          render json: {status: :success, level: 1,
            html: render_to_string(@comment2rd)}
      end
    end
  end

  def show

  end

  def destroy
    @comment = Comment.find_by id: params[:id]

    if @comment.destroy
      render json: {status: :success}
    else
      render json: {status: :error}
    end
  end

  private

  def comment_params
    params.require(:comment).permit :body, :comment1st_id, :post_id
  end
end
