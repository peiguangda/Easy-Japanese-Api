class Api::V1::CardsController < ApplicationController
  include Authenticable
  before_action :authenticate_with_token!
  respond_to :json

  def index
    course = find_course
    cards = course.topics.find(params[:topic_id]).cards.all if course
    render json: {data: cards, status: "success"}, status: 200
  end

  def create
    course = find_course
     return render json: {errors: "not found course"}, status: 422 unless course
    card = Topic.find(params[:topic_id]).cards.build card_params
    card.set_user_create_card current_user if card
    card.set_course_for_card course if card
    if card.save
      render json: {data: card, status: "success"}, status: 200, location: api_course_topic_cards_path
    else
      render json: {errors: card.errors}, status: 422
    end
  end

   def update
    card = find_card
    if card.update card_params
      render json: {data: card, status: "success"}, status: 201, location: api_course_topic_cards_path
    else
      render json: {errors: card.errors}, status: 422
    end
  end

  def show
    card = find_card
    return respond_with card if card
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

   def find_course
    course = Course.find_by(id: params[:course_id])
  end

  def find_topic
    course = find_course
    topic = course.topics.find_by(id: params[:topic_id]) if course
  end

  def find_card
    topic = find_topic
    topic.cards.find_by id: params[:id] if topic
  end

  def card_params
    params.require(:card).permit :order_index, :difficulty_level,
                                 :parent_id, :has_child, :status, :code,
                                 :shuffle_anser, :front_text, :front_image, :front_sound, :front_hint, :back_text, :back_image, :back_sound, :back_hint
  end
end
