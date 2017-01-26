class Admin::UsersController < Admin::BaseController

  before_action :set_user, only: [:show, :edit, :update, :destroy, :invite]

  def index
    @users = User.includes(:family).all.order("#{sort_column} #{sort_direction}")
  end

  def show
    @required_hours = Rails.application.config.required_hours
    @total_task_hours = @user.total_hours
    @percent_done = @total_task_hours / @required_hours * 100
    @percent_over = (@total_task_hours - @required_hours) / @required_hours * 100
    #@tasks = Task.where(user_id: current_user).order("created_at DESC").includes(user: :family, :task_type)
    @tasks = @user.tasks.includes(:task_type).order("created_at DESC")
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_users_path
    else
      logger.debug @user.errors.full_messages
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy

    redirect_to admin_users_path
  end

  def invite
    @user.invite!
    flash[:notice] = "Okay. Just invited #{@user.first_name}"

    redirect_to admin_users_path
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def sortable_columns
    ["first_name", "families.name"]
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone, :family_id, :is_admin)
  end
end
