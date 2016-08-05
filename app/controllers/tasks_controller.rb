class TasksController < ApplicationController

  before_action :find_task, only: [:show, :edit, :update, :destroy]

  def index
    # TODO: Move to an admin setting
    @required_hours = 45;
    @total_task_hours = current_user.total_hours
    @percent_done = @total_task_hours / @required_hours * 100;
    @tasks = Task.where(user_id: current_user).order("created_at DESC")
    # @tasks = Task.where(family_id: current_user.family_id).order("created_at DESC")
  end

  def show
  end

  def new
    @task = current_user.tasks.build
  end

  def create
    @task = current_user.tasks.build(task_params)

    if @task.save
      redirect_to @task
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @task.update(task_params)
      redirect_to @task
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
    params.require(:task).permit(:hours, :notes, :task_type_id)
  end

end
