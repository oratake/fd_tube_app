# class Api::V1::CommentsController < ApplicationController
# end

# frozen_string_literal: true

module Api
  module V1
    class CommentsController < ApplicationController
      def index
        @video = video.find(params[:video_id])
        @comments = @video.comments.order('created_at DESC')
      end

      def create
        @comment = Comment.new(comment_params)
        if @comment.save
          render :index, status: :created
        else
          render json: @comment.errors, status: :unprocessable_entity
        end
      end

      private

      def comment_params
        params.require(:comment).permit(:body, :video_id)
      end
    end
  end
end
