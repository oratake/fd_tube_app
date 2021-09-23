class Admin::S3filesController < ApplicationController
  def initialize
    super
    @region = 'ap-northeast-1'
    @input_bucketname = ENV['AWS_S3_INPUT_BUCKET_NAME'] 
    @output_bucketname = ENV['AWS_S3_OUTPUT_BUCKET_NAME'] 
    @s3 = get_s3_resource
  end

  def index 
    @s3files = S3file.includes(:video).all
  end
  
  def new
    @s3file = S3file.new()
    @s3file.build_video
  end
  
  def create
    @s3file = S3file.new(s3file_params)

    if @s3file.save
      file = s3file_params[:key]
      filename = file.original_filename
      file_path = "tmp/s3/#{filename}"
      File.binwrite(file_path, file.read)
      bucket = @s3.bucket(@input_bucketname)

      # ここで新s3カラムにfilenameを登録
      # S3file.create(file_name: filename)
      #binging.pry

      key = filename
      object = bucket.object(key)
      object.upload_file(file_path, acl:'public-read')

      redirect_to action: "index"
    else
      flash[:alert] = "失敗っす"
      render "new"
    end
  end

  def show
    @s3file = S3file.find(params[:id])
  end

  def destroy
    s3file = S3file.find(params[:id]) #テーブルからデータを取り出す
    key = s3file.key  # キー（ファイル名）取得 
  
    bucket = @s3.bucket(@input_bucketname) # バケット指定
    object = bucket.object(key)  # キー指定
    object.delete  # オブジェクト（ファイル）削除
  
    s3file.destroy
    redirect_to admin_s3files_path, flash: {notice: "ファイル [#{key}] を削除しました"}
  end

  private

  def get_s3_resource
    Aws::S3::Resource.new(
      region: @region,
      credentials: Aws::Credentials.new(
          ENV['AWS_ACCESS_KEY'],  
          ENV['AWS_SECRET_KEY']
       )
    )
  end

  def s3file_params
    params.require(:s3file).permit(:key, video_attributes: [:title, :description, :remarks])
  end
end
