class StudentsController < ApplicationController
  def index
    @students = Student.all.order(created_at: :asc)
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      redirect_to @student
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    redirect_to students_path, status: :see_other
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :birthdate, :department, :terms_of_usage)
  end
end
