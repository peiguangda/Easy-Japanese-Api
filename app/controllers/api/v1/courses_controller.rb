class Api::V1::CoursesController < ApplicationController
  include Authenticable
  before_action :authenticate_with_token!
  respond_to :json

  def index
    respond_with Course.all
  end

  def create
    course = current_user.courses.build course_params
    if course.save
      render json: {course: course}, status: 200, location: [:api, course]
    else
      render json: {errors: course.errors}, status: 422
    end
  end

  def update
    course = find_course
    if course.update course_params
      render json: {course: course}, status: 201, location: [:api, course]
    else
      render json: {errors: course.errors}, status: 422
    end
  end

  def show
    respond_with find_course
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
                                 :end_date, :status, :index, :time_expire, :day_to_open_lesson, :type
  end

end
