class Api::V1::VideoTimeItemsController < ApplicationController
  include Authenticable
  before_action :authenticate_with_token!, only: [:create, :update, :destroy]
  respond_to :json

  def index
    video_time_items = VideoTimeItem.where video_scenario_id: video_time_item_params[:video_scenario_id] if video_time_item_params[:video_scenario_id]
    render json: {data: video_time_items, status: "success"}, status: 200
  end

  def create
    params.require(:video_time_item).each do |key, value|
      video_time_item = VideoTimeItem.create value.to_unsafe_h
      if video_time_item.save
        byebug
      else
        return render json: {errors: video_time_item.errors}, status: 422
      end
      render json: {status: "success"}, status: 200
    end
  end

  private

  def video_time_item_params
    params.require(:video_time_item).permit :video_scenario_id, :list_card_id, :index, :time_practice,
                                 :title, :code, :data, :start_time
  end
end
