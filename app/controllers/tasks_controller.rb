class TasksController < ApplicationController

  before_action :find_task, only: [:show, :edit, :update, :destroy]

  def index
    @task = current_user.tasks.build
    @required_hours = Rails.application.config.required_hours
    @total_task_hours = current_user.total_family_hours
    @percent_done = @total_task_hours / @required_hours * 100
    @percent_over = (@total_task_hours - @required_hours) / @required_hours * 100
    #@tasks = Task.where(user_id: current_user).order("created_at DESC").includes(user: :family, :task_type)
    @tasks = Task.includes(:user, :task_type).where(family_id: current_user.family_id).order("created_at DESC")
  end

  def show
  end

  def new
    @task = current_user.tasks.build
  end

  def create
    @task = current_user.tasks.build(task_params)
    @task.family = current_user.family

    if @task.save
      #redirect_to @task
      redirect_back(fallback_location: root_path)
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @task.update(task_params)
      flash[:notice] = "Okay. Updated that task."
      redirect_to tasks_path
    else
      render 'edit'
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def find_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:hours, :performed_on, :notes, :task_type_id)
  end

end
