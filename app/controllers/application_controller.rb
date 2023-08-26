class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :sort_column, :sort_direction

  before_action :authenticate_user!

  private
  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  def sort_column
    sortable_columns.include?(params[:column]) ? params[:column] : sortable_columns.first
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
