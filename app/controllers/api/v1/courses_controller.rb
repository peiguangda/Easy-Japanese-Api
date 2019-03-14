class Api::V1::CoursesController < ApplicationController
  include Authenticable
  before_action :authenticate_with_token!
  respond_to :json


  def create
    course = current_user.courses.build course_params
    if course.save
      render json: course, status: 201, location: [:api, course]
    else
      render json: {errors: course.errors}, status: 422
    end
  end

  private

  def course_params
    params.require(:course).permit :code, :short_description, :name,
                                 :owner_name, :avatar, :description, :password, :android_url,
                                 :end_date, :status, :index, :time_expire, :day_to_open_lesson, :type
  end

end
