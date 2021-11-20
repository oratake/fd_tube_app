class VideosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_q

  def index
    @s3files = S3file.includes(:video).all
  end

  def show
    @s3file = S3file.includes(:video).find(params[:id])
    @s3file_name = @s3file.file_name.split('.').first
    @user = current_user
    @comments = @s3file.video.comments.order('created_at DESC')

    # binding.pry
  end

  def search
    @results = @q.result
  end
end
