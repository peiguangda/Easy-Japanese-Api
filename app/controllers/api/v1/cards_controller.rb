class Api::V1::CardsController < ApplicationController
  include Authenticable
  before_action :authenticate_with_token!, only: [:create, :update, :destroy]
  respond_to :json

  def index
    topic = find_topic
    cards = topic.cards.all if topic
    render json: {data: cards, status: "success"}, status: 200
  end

  def create
    params.require(:card).each do |key, value|
      topic = find_topic value
      card = topic.cards.build value.to_unsafe_h if topic
      card.set_user_create_card current_user if card
      card.set_course_for_card topic if topic
      if card.save
        topic.question_number += 1
        topic.save
      else
        return render json: {errors: card.errors}, status: 422
      end
    end
    render json: {status: "success"}, status: 200, location: api_cards_path
  end

  def update
    card = find_card
    if card.update params.require(:card).to_unsafe_h
      render json: {data: card, status: "success"}, status: 201, location: api_cards_path
    else
      render json: {errors: card.errors}, status: 422
    end
  end

  def show
    card = find_card
    return render json: {data: card, status: "success"} if card
    render json: {errors: "not found card"}, status: 422
  end

  def destroy
    card = find_card
    return render json: {errors: "not found card"}, status: 422 unless card
    if card.destroy
      render json: {status: "success"}
    else
      render json: {errors: card.errors}, status: 422
    end
  end

  private

  def find_topic value=params
    Topic.find_by(id: value[:topic_id])
  end

  def find_card
    Card.find_by id: params[:id]
  end
  
  def param_length
    params.require(:card).as_json.length
  end

  def card_params
    params.require(:card).permit :topic_id, :course_id,:order_index, :difficulty_level,
                                :parent_id, :has_child, :status, :code,
                                :shuffle_anser, :front_text, :front_image, :front_sound, :front_hint, :back_text, :back_image, :back_sound, :back_hint, :list_answer => [], :list_correct_answer => []
  end
end
