class Admin::DashboardController < Admin::BaseController
  def index
    @total_hours = Task.sum(:hours)
  end
end
