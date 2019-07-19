class WorkoutDetailsController < ApplicationController
  before_action :validate_workout_id, only: [:show, :create]

  def show
    respond_to do |format|
      workout_details = WorkoutDetail.where(workout_id: params[:workout_id])
      format.json {render json: workout_details.as_json}
    end
  end

  def create
    workout_id = params[:workout_id]
    workout_details = WorkoutDetail.where workout_id: workout_id
    workout_details.delete_all
    workout_detail_params.each do |item|
      detail = WorkoutDetail.new(item)
      detail.workout_id = workout_id
      unless detail.save
        puts 'error'
      end
    end
    respond_to do |format|
      format.json {render json: 'success', status: :created}
    end
  end

  private
  def workout_detail_params
    params.require(:workout_details).map do |workout_detail|
      workout_detail.permit(:menu_kind, :times, :interval, :note, :distance)
    end
  end

  def validate_workout_id
    workouts = Workout.where(id: params[:workout_id], user_id: current_user.id)
    if workouts.empty?
      raise ActionController::RoutingError.new('Not Found')
    end
  end
end
