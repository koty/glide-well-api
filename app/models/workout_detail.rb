# == Schema Information
#
# Table name: workout_details
#
#  id         :bigint           not null, primary key
#  workout_id :bigint           not null
#  menu_kind  :integer          not null
#  times      :integer          not null
#  interval   :integer          not null
#  note       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  distance   :integer          not null
#

class WorkoutDetail < ApplicationRecord
  belongs_to :workout
end
