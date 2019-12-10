module ApplicationHelper
  def current_workout
    current_user.current_workout if current_user
  end
end
