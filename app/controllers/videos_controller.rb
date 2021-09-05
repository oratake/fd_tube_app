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
end
