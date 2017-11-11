class Admin::DashboardController < Admin::BaseController
  def index
    @period = Period.latest
    @total_hours = Task.total_hours_since(@period.from_date)
    @tasks = Task.performed_after(@period.from_date)
  end
end
