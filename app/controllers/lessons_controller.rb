class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_lesson
  
  def show
  end

private

def require_authorized_for_current_lesson
    if current_lesson.user != current_user
      redirect_to course_path(@course), alert: "Unauthorized! Please Enroll in Course"
    end
end

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end
