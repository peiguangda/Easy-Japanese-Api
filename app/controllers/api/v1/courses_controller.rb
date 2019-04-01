class Api::V1::CoursesController < ApplicationController
  include Authenticable
  before_action :authenticate_with_token!, only: [:create, :update, :destroy]
  respond_to :json

  def index
    courses = Course.all
    render json: {data: courses, status: "success"}, status: 200
  end

  def create
    course = current_user.courses.build course_params
    if course.save
      render json: {data: course, status: "success"}, status: 200, location: [:api, course]
    else
      render json: {errors: course.errors}, status: 422
    end
  end

  def update
    course = find_course
    if course.update course_params
      render json: {data: course, status: "success"}, status: 201, location: [:api, course]
    else
      render json: {errors: course.errors}, status: 422
    end
  end

  def show
    render json: {data: find_course, status: "success"}
  end

  def destroy
    if find_course.destroy
      render json: {status: "success"}
    else
      render json: {errors: course.errors}, status: 422
    end
  end

  private

  def find_course
    current_user.courses.find params[:id]
  end

  def course_params
    params.require(:course).permit :code, :short_description, :name,
                                 :owner_name, :avatar, :description, :password, :android_url,
                                 :end_date, :status, :index, :time_expire, :day_to_open_lesson, :type, :cost, :language
  end

end
