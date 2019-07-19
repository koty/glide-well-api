class Api::WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :update, :destroy]

  def new
    @workout = Workout.new
    @workout.date = Date.today.strftime('%Y-%m-%d')
    @workout.kind = 'swimming'
  end

  def index
    # user_id = current_user.id
    user_id = get_dummy_user.id
    @workouts = Workout.where(user_id: user_id).order(date: "DESC")
    render json: @workouts, adapter: :json, status: 200
  end

  def create
    # user_id = current_user.id
    user_id = get_dummy_user.id
    w = params.permit(:date, :kind, :impression)
    @workout = Workout.new(w)
    @workout.user_id = user_id
    @workout.timestamps = Time.now
    if @workout.save
      update_details(@workout.id)
      render json: @workout, adapter: :json, status: 201
    else
      render json: @workout, adapter: :json, status: 400
    end
  end

  def show
    @workout
  end

  def update
    w = params.permit(:id, :date, :kind, :impression)
    if @workout.update(w)
      update_details(@workout.id)
      render json: @workout, adapter: :json, status: 201
    else
      render json: @workout, adapter: :json, status: 400
    end
  end

  def destroy
    @workout.destroy
  end

  private

  def update_details(workout_id)
    WorkoutDetail.where(workout_id: workout_id).delete_all
    p = params.permit(:id, :date, :kind, :impression,
                      workout_details: [:id, :menu_kind, :times, :distance, :interval, :note, :workout_id])
    details = p[:workout_details]
    details.each do |detail|
      rec = WorkoutDetail.new(detail)
      rec.workout_id = workout_id
      rec.save
    end
  end

  def set_workout
    # user_id = current_user.id
    user_id = get_dummy_user.id
    workout_id = params.permit(:id)[:id]
    workouts = Workout.where(id: workout_id, user_id: user_id)
    if workouts.empty?
      raise ActionController::RoutingError.new('Not Found')
    else
      puts workouts[0]
      @workout = workouts[0]
    end
  end

  def get_dummy_user
    users = User.all
    users[0]
  end
end
