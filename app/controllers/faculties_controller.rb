class FacultiesController < ApplicationController
  def index
    create_callback_hash
    @faculties = Faculty.all.order(created_at: :asc)
  end

  def show
    create_callback_hash
    @faculty = Faculty.find(params[:id])
  end

  def new
    create_callback_hash
    @faculty = Faculty.new
  end

  def create
    create_callback_hash
    @faculty = Faculty.new(faculty_params)
    if @faculty.save
      redirect_to @faculty
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    create_callback_hash
    @faculty = Faculty.find(params[:id])
  end

  def update
    create_callback_hash
    @faculty = Faculty.find(params[:id])
    if @faculty.update(faculty_params)
      redirect_to @faculty
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    create_callback_hash
    @faculty = Faculty.find(params[:id])
    @faculty.destroy

    redirect_to faculties_path, status: :see_other
  end

  private

  def faculty_params
    params.require(:faculty).permit(:designation, :first_name, :last_name, :birthdate, :email, :phone)
  end
end
