class Api::V1::TopicProgressesController < ApplicationController
  include Authenticable
  before_action :authenticate_with_token!
  respond_to :json

  def index
    topic_progresses = TopicProgress.where({ user_id: current_user.id, topic_id: topic_progress_params[:topic_id]})
    render json: {data: topic_progresses, status: "success"}, status: 200 if topic_progresses
  end

  def create
    topic_progress = current_user.topic_progresses.build topic_progress_params
    if topic_progress.save
      render json: {data: topic_progress, status: "success"}, status: 200, location: [:api, topic_progress]
    else
      render json: {errors: topic_progress.errors}, status: 422
    end
  end

   def update
    topic_progress = find_topic_progress
    if topic_progress.update topic_progress_params
      render json: {data: topic_progress, status: "success"}, status: 201, location: [:api, topic_progress]
    else
      render json: {errors: topic_progress.errors}, status: 422
    end
  end

  private

  def find_topic_progress
     topic_progress = TopicProgress.find_by id: params[:id]
  end
  def topic_progress_params
    params.require(:topic_progress).permit :topic_id, :parent_id, :progress,
                                 :content_type, :status, :numbers_question_essay, :numbers_question_marked, :view_num,
                                 :passed, :test_score, :user_name, :category_name
  end
end
