class VideosController < ApplicationController
  before_action :authenticate_user!

  def index
    @videos = Video.all
  end

  def show
  end
end
