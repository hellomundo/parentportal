class Admin::TaskTypesController < ApplicationController
  before_action :find_task_type, only: [:show, :edit, :update, :destroy]

  def index
    @task_types = TaskType.all
  end

  def show
  end

  def new
    @task_type = TaskType.new
  end

  def create
    @task_type = TaskType.new(task_type_params)

    if @task_type.save
      redirect_to admin_task_types_path
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @task_type.update(task_type_params)
      redirect_to admin_task_types_path
    else
      render 'edit'
    end
  end

  def destroy
    @task_type.destroy
    redirect_to admin_task_types_path
  end

  private

  def find_task_type
    @task_type = TaskType.find(params[:id])
  end

  def task_type_params
    params.require(:task_type).permit(:name, :description)
  end

end
