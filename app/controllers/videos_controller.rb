class VideosController < ApplicationController
  before_action :authenticate_user!

  def index
    @s3files = S3file.includes(:video).all
  end

  def show
  end
end
