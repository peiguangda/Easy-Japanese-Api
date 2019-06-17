class Api::V1::VideoScenariosController < ApplicationController
  include Authenticable
  before_action :authenticate_with_token!, only: [:create, :update, :destroy]
  before_action :find_topic, only: [:show, :create, :update]
  respond_to :json

  def index
    video_scenarios = VideoScenario.all
    render json: {data: video_scenarios, status: "success"}, status: 200
  end

  def create
    video_scenario = VideoScenario.create video_scenario_params
    lesson = Topic.find video_scenario_params[:topic_id]
    video_scenario.course_id = lesson.id if lesson
    if video_scenario.save
      render json: {data: video_scenario, status: "success"}, status: 200, location: [:api, video_scenario]
    else
      render json: {errors: video_scenario.errors}, status: 422
    end
  end

  def update
    video_scenario = @topic.video_scenario
    if video_scenario.update video_scenario_params
      render json: {data: video_scenario, status: "success"}, status: 201, location: [:api, video_scenario]
    else
      render json: {errors: video_scenario.errors}, status: 422
    end
  end

  def show
    render json: {data: @topic.video_scenario, status: "success"}
  end

  def destroy
    if find_course.destroy
      render json: {status: "success"}
    else
      render json: {errors: course.errors}, status: 422
    end
  end

  private

  def find_topic
    @topic = Topic.find video_scenario_params[:topic_id]
    return render json: {errors: "not found topic"}, status: 422 unless @topic
  end

  def video_scenario_params
    params.require(:video_scenario).permit :topic_id, :course_id, :auto_play,
                                 :status, :type, :start_time, :end_time, :video_url,
                                 :time_question_data, :title, :description, :thumbnail, :is_must_answer, :is_must_answer_correct
  end

end
