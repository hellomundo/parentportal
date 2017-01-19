class Admin::PeriodsController < Admin::BaseController
  before_action :find_period, only: [:show, :edit, :update, :destroy]

  def index
    @periods = Period.all
  end

  def show
  end

  def new
    @period = Period.new
  end

  def create
    @period = Period.new(period_params)

    if @period.save
      redirect_to admin_periods_path
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @period.update(period_params)
      redirect_to admin_periods_path
    else
      render 'edit'
    end
  end

  def destroy
    @period.destroy
    redirect_to admin_periods_path
  end

  private

  def find_period
    @period = Period.find(params[:id])
  end

  def period_params
    params.require(:period).permit(:name, :from_date, :to_date)
  end
end
