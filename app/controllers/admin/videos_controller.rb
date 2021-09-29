class Admin::VideosController < ApplicationController
  before_action :if_not_admin
  # before_action :set_video, only: [:show, :edit, :destroy]
  def initialize
    super
    @region = 'ap-northeast-1'
    @input_bucketname = ENV['AWS_S3_INPUT_BUCKET_NAME'] 
    @output_bucketname = ENV['AWS_S3_OUTPUT_BUCKET_NAME'] 
    @s3 = get_s3_resource
  end

  def index
  end

  def new
    @video = Video.new
  end

  def create
    # ポストされたfileデータを取得
    file = s3file_params[:key]
    filename = file.original_filename

    #  一時保存用のパスにファイルを保存 
    file_path = "tmp/s3/#{filename}"
    File.binwrite(file_path, file.read)
    
    # バケット名を指定
    bucket = @s3.bucket(@input_bucketname)
    
    # バケットに保存する際の一意の識別名（ファイル名）を指定 
    key = filename
    # S3にアップロードする際に特定のディレクトリに入れたい場合は、filename の先頭に
    # ディレクトリ名を追加してください
    # 例：key = "dir1/dir2/#{filename}"）
    object = bucket.object(key)

    # upload_fileメソッドを使って、S3上のバケットにファイルをアップロードする 
    # 　第一引数 = 一時保存してあるファイルのパス 
    # 　第二引数 = オプション(aclはアクセス権) 
    object.upload_file(file_path, acl:'public-read')
  
    # アップロードしたファイルのキーをDBに保存 
    s3file = S3file.new(key: key)
    s3file.save
  
    if @video.save && @s3file.save
      flash[:notice] = "登録しました"
      redirect_to admin_videos_path
    else
      flash[:alert] = "失敗っす"
      render "new"
    end
  end

  # def show
  # end

  def edit
    @video = Video.find(params[:id])
    @video_name = @video.s3file.file_name
    
    # binding.pry
  end

  def update
  end

  def destroy
  end

  private

  # こいつはヘルパー化
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end

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
    # params.require(:s3file).permit(:key)
    params.permit(:key)
  end

  # def set_video
  #   @video = Video.find(params[:id])
  # end
end
