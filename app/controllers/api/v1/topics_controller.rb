class Api::V1::TopicsController < ApplicationController
  include Authenticable
  before_action :authenticate_with_token!
  respond_to :json

  def index
    course = find_course
    topics = course.topics.all if course
    render json: {data: topics, status: "success"}, status: 200
  end

  def create
    topic = Course.find(params[:course_id]).topics.build topic_params
    topic.set_user_create_topic current_user if topic
    if topic.save
      render json: {data: topic, status: "success"}, status: 200, location: api_course_topics_path
    else
      render json: {errors: topic.errors}, status: 422
    end
  end

   def update
    topic = find_topic
    if topic.update topic_params
      render json: {data: topic, status: "success"}, status: 201, location: api_course_topics_path
    else
      render json: {errors: topic.errors}, status: 422
    end
  end

  def show
    topic = find_topic
    return respond_with topic if topic
    render json: {errors: "not found topic"}, status: 422
  end

  def destroy
    topic = find_topic
    return render json: {errors: "not found topic"}, status: 422 unless topic
    if topic.destroy
      render json: {status: "success"}
    else
      render json: {errors: topic.errors}, status: 422
    end
  end

  private

  def find_course
    course = Course.find_by(id: params[:course_id])
  end

  def find_topic
    course = find_course
    course.topics.find_by id: params[:id] if course
  end

  def topic_params
    params.require(:topic).permit :parent_id, :level,
                                 :status, :childrent_type, :start_time, :end_time, :tag,
                                 :sort_id, :order_index, :user_name, :name, :description, :short_description, :avatar, :total_card_num, :question_number, :password, :duration, :pass, :time_practice, :score_scale
  end
end

