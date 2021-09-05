class VideosController < ApplicationController
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
end
