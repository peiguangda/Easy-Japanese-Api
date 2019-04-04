class Api::V1::UserCoursesController < ApplicationController
  include Authenticable
  before_action :authenticate_with_token!, only: [:create, :update, :destroy]
  respond_to :json

  def index
    user_course = UserCourse.where({course_id: user_course_params[:course_id]}) if user_course_params[:course_id]
    user_course = UserCourse.where({user_id: user_course_params[:user_id]}) if user_course_params[:user_id]
    render json: {data: user_course, status: "success"}, status: 201 if user_course
  end

  def create
    user_course = current_user.user_courses.build user_course_params
    if user_course.save
      render json: user_course, status: 201, location: [:api, user_course]
    else
      render json: {errors: user_course.errors}, status: 422
    end
  end

  def show
    user = find_user
    render json: user, status: 400 if user
  end

  def destroy
    user = find_user
    return render json: {errors: "not found user"}, status: 422 unless user
    if user.destroy
      render json: {status: "success"}
    else
      render json: {errors: user.errors}, status: 422
    end
  end

  private

  def find_user
    UserCourse.find_by user_id: params[:id]
  end

  def user_course_params
    params.require(:user_course).permit :course_id, :role_type, :join_date, :expire_date,
                                 :total_time_study, :status, :topic_passed, :exp, :rate_value,
                                 :role_name, :comment, :admin_comment
  end

end
