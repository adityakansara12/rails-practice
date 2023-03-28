class StudentsController < ApplicationController
  def index
    create_callback_hash
    @students = Student.all.order(created_at: :asc)
  end

  def show
    create_callback_hash
    @student = Student.find(params[:id])
  end

  def new
    create_callback_hash
    @student = Student.new
  end

  def create
    create_callback_hash
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    create_callback_hash
    @student = Student.find(params[:id])
  end

  def update
    create_callback_hash
    @student = Student.find(params[:id])
    if @student.update(student_params)
      redirect_to @student
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    create_callback_hash
    @student = Student.find(params[:id])
    @student.destroy

    redirect_to students_path, status: :see_other
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :birthdate, :email, :department, :terms_of_usage)
  end
end
