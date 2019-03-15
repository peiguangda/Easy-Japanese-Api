class Api::V1::UserCoursesController < ApplicationController
  include Authenticable
  before_action :authenticate_with_token!
  respond_to :json

  def create
    user_course = current_user.user_courses.build user_course_params
    if user_course.save
      render json: user_course, status: 201, location: [:api, user_course]
    else
      render json: {errors: user_course.errors}, status: 422
    end
  end

  private

  def user_course_params
    params.require(:user_course).permit :course_id, :role_type, :join_date, :expire_date,
                                 :total_time_study, :status, :topic_passed, :exp, :rate_value,
                                 :role_name, :comment, :admin_comment
  end

end
