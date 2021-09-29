class Admin::VideosController < ApplicationController
  before_action :if_not_admin
  # before_action :set_video, only: [:show, :edit, :destroy]

  # def initialize
  #   super
  #   @region = 'ap-northeast-1'
  #   @input_bucketname = ENV['AWS_S3_INPUT_BUCKET_NAME'] 
  #   @output_bucketname = ENV['AWS_S3_OUTPUT_BUCKET_NAME'] 
  #   @s3 = get_s3_resource
  # end

  def index
  end

  # def new
  #   @video = Video.new
  # end

  # def create
  #   file = s3file_params[:key]
  #   filename = file.original_filename
  #   file_path = "tmp/s3/#{filename}"
  #   File.binwrite(file_path, file.read)
  #   bucket = @s3.bucket(@input_bucketname)
  #   key = filename
  #   object = bucket.object(key)
  #   object.upload_file(file_path, acl:'public-read')
  #   s3file = S3file.new(key: key)
  #   s3file.save
  
  #   if @video.save && @s3file.save
  #     flash[:notice] = "登録しました"
  #     redirect_to admin_videos_path
  #   else
  #     flash[:alert] = "失敗っす"
  #     render "new"
  #   end
  # end

  # def show
  # end

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

  # こいつはヘルパー化
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end

  # def get_s3_resource
  #   Aws::S3::Resource.new(
  #     region: @region,
  #     credentials: Aws::Credentials.new(
  #         ENV['AWS_ACCESS_KEY'],  
  #         ENV['AWS_SECRET_KEY']
  #      )
  #   )
  # end

  # def s3file_params
  #   params.permit(:key)
  # end

  def video_params
    params.require(:video).permit(:title, :description, :remarks)
  end
end
