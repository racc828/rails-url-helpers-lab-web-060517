class StudentsController < ApplicationController
  before_action :set_student, only: :show

  def index
    @students = Student.all
  end

  def show
    @student = set_student
    if @student.active
      @status = "active"
    else
      @status = "inactive"
    end
  end

  def activate
    @student = set_student
    if @student.active == false
      @student.active = true
    else
      @student.active = false
    end
    @student.save
    redirect_to student_path(@student)
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end
