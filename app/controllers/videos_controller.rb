class VideosController < ApplicationController
  before_action :authenticate_user!

  def index
    @s3files = S3file.includes(:video).all
  end

  def show
    @s3file = S3file.includes(:video).find(params[:id])
    @s3file_name = @s3file.file_name.split(".")[0]
    binding.pry
  end
end
