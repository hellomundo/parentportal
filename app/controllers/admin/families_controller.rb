class Admin::FamiliesController < Admin::BaseController
  before_action :set_family, only: [:show, :edit, :update, :destroy]

  def index
    #@families = Family.all
    start_date = Period.current_period_start_date
    # @families = Family.joins(:tasks).where("tasks.performed_on > ?", start_date).select('families.*, sum(tasks.hours) as total_hours').group('families.id').order("#{sort_column} #{sort_direction}")
    @families = Family.select('families.*, sum(tasks.hours) as total_hours').left_outer_joins(:tasks).group('families.id').order("#{sort_column} #{sort_direction}")
  end

  def show
    @members = User.where(family: @family)
  end

  def new
    @family = Family.new
  end

  def create
    @family = Family.new(family_params)

    if @family.save
      redirect_to admin_families_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @family.update(family_params)
      redirect_to admin_families_path
    else
      render 'edit'
    end
  end

  def destroy
    @family.destroy

    redirect_to admin_families_path
  end

  private

  def set_family
    @family = Family.find(params[:id])
  end

  def family_params
    params.require(:family).permit(:name)
  end

  def sortable_columns
    ["families.name", "total_hours"]
  end


end
