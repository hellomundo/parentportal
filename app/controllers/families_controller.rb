class FamiliesController < ApplicationController
  before_action :set_family, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
  end

  def create

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_family
    @family = Family.find(params[:id])
  end

  def family_params
    params.require(:family).permit(:name)
  end

end
