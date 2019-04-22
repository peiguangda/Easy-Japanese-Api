class Api::V1::CardProgressesController < ApplicationController
  include Authenticable
  before_action :authenticate_with_token!, only: [:create, :update, :destroy]
  respond_to :json

  def index
    card_progresses = CardProgress.where({ user_id: current_user.id, card_id: card_progress_params[:card_id]})
    render json: {data: card_progresses, status: "success"}, status: 200 if card_progresses
  end

  def create
    card_progress = current_user.card_progresses.build card_progress_params
    if card_progress.save
      render json: {data: card_progress, status: "success"}, status: 200, location: [:api, card_progress]
    else
      render json: {errors: card_progress.errors}, status: 422
    end
  end

   def update
    params.require(:card_progress).each do |key, value|
      card_progress = find_card_progress value
      if card_progress.update value.to_unsafe_h
        render json: {data: card_progress, status: "success"}, status: 201, location: [:api, card_progress]
      else
      render json: {errors: card_progress.errors}, status: 422
      end
    end
  end

  def destroy
    card_progress = find_card_progress
    return render json: {errors: "not found card progress"}, status: 422 unless card_progress
    if card_progress.destroy
      render json: {status: "success"}
    else
      render json: {errors: card_progress.errors}, status: 422
    end
  end

  private

  def find_card_progress value=params
     card_progress = CardProgress.find_by id: params[:id]
  end
  def card_progress_params
    params.require(:card_progress).permit :card_id, :course_id, :topic_id,
                                 :card_type, :skill, :last_result, :box_num, :difficulty_level,
                                 :progress
  end
end
