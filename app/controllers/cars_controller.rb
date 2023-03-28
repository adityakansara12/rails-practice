class CarsController < ApplicationController
  before_action :authenticate
  before_action :admin?, except: [:index], only: %i[edit destroy]
  http_basic_authenticate_with name: 'admin1', password: 'admin1', except: :index

  def index
    @cars = Car.all.order(created_at: :asc)
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to @car
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])
    if @car.update(car_params)
      redirect_to @car
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy

    redirect_to cars_path, status: :see_other
  end

  def search
    @cars = Car.where(company: params[:company])
    render :index
  end

  def download_pdf
    send_data generate_pdf,
              filename: 'cars_index.pdf',
              type: 'application/pdf'
  end

  private

  def generate_pdf
    @cars = Car.all
    pdf = Prawn::Document.new
    pdf.text("Car List", align: :center)
    table_data = Array.new
    table_data << ["Name","Company","Price"]
    @cars.each do |p|
      table_data << [p.id, p.company, p.price]
    end
    pdf.table(table_data, width: 400, position: :center, cell_style: { inline_format: true, background_color: "ccffff" })
    pdf.render
  end

  def car_params
    params.require(:car).permit(:company, :price)
  end

  def authenticate
    return if logged_in?

    flash[:alert] = 'Please, Login first'
    redirect_to login_path
  end

  def admin?
    return if User.find(session[:user_id]).role == 'admin'

    flash[:alert] = 'Unauthorized access detected'
    redirect_to cars_path
  end
end
