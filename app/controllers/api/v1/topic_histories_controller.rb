class Api::V1::TopicHistoriesController < ApplicationController
  include Authenticable
  before_action :authenticate_with_token!, only: [:create, :update, :destroy]
  respond_to :json

  def index
    topic_histories = TopicHistory.where({ user_id: current_user.id, topic_id: topic_history_params[:topic_id]}).last(5)
    render json: {data: topic_histories, status: "success"}, status: 200 if topic_histories
  end

  def create
    topic_history = current_user.topic_histories.build topic_history_params
    if topic_history.save
      render json: {data: topic_history, status: "success"}, status: 200, location: [:api, topic_history]
    else
      render json: {errors: topic_history.errors}, status: 422
    end
  end

   def update
    topic_history = find_topic_history
    if topic_history.update topic_history_params
      render json: {data: topic_history, status: "success"}, status: 201, location: [:api, topic_history]
    else
      render json: {errors: topic_history.errors}, status: 422
    end
  end

  private

  def find_topic_history
     topic_history = TopicHistory.find_by id: params[:id]
  end
  def topic_history_params
    params.require(:topic_history).permit :topic_id, :course_id, :user_id,
                                 :score, :correct, :total, :data
  end
end
