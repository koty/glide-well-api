# == Schema Information
#
# Table name: workouts
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  date       :date             not null
#  kind       :string           not null
#  timestamps :datetime         not null
#  impression :text
#

class WorkoutSerializer < ActiveModel::Serializer
  attributes :id, :date, :kind, :impression, :workout_details
  def workout_details
    ActiveModelSerializers::SerializableResource.new(object.workout_details,  each_serializer: WorkoutDetailSerializer)
  end
  class WorkoutDetailSerializer < ActiveModel::Serializer
    attributes :id, :menu_kind, :times, :interval, :note, :distance
  end
end
