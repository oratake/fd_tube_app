class Admin::VideosController < ApplicationController
  before_action :set_q, :if_not_admin

  def edit
    @video = Video.find(params[:id])
    @video_name = @video.s3file.file_name
  end

  def update
    @video = Video.find(params[:id])
    @video.update(video_params)
    redirect_to admin_s3files_path
  end

  def destroy
  end

  private

  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end

  def video_params
    params.require(:video).permit(:title, :description, :remarks)
  end
end
