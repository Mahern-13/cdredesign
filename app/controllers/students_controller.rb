
class StudentsController < ApplicationController

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:notice] = "You will receive an email shortly"
      redirect_to(pages_path)
    else
      render('new')
    end
  end

  private

  def student_params
    params.require(:student).permit(:name,:email)
  end
end
