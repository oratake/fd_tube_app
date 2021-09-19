class Admin::VideosController < ApplicationController
  before_action :if_not_admin
  # before_action :set_video, only: [:show, :edit, :destroy]

  def index
    @videos = Video.all
  end

  def new
    @video = Video.new
  end

  def create
  end

  def show
  end

  def exit
  end

  def update
  end

  def destroy
  end

  # def xxxxx #使う時にコメントアウト外す
  #   s3 = get_s3_resource
  #  end
   
  #  private

  #  def get_s3_resource
  #    region = <バケットのリージョン>
  #    Aws::S3::Resource.new(
  #      region: region,
  #      credentials: Aws::Credentials.new(
  #          ENV['AWS_ACCESS_KEY'],
  #          ENV['AWS_SECRET_KEY']
  #      )
  #    )
  #  end

  private
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end

  # def set_video
  #   @video = Video.find(params[:id])
  # end
end
