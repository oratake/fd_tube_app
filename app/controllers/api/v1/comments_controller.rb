class Api::V1::CommentsController < ApiController
  def index
    @video = Video.find(params[:id])
    @comments = @video.comments.order('created_at DESC')
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render :index, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:context, :user_id, :video_id)
  end
end
