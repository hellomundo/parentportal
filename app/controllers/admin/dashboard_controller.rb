class Admin::DashboardController < Admin::BaseController
  def index
    @period = Period.last
    @total_hours = Task.sum(:hours)
    @tasks = Task.all
  end
end
