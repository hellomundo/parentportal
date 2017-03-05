module Admin::DashboardHelper
  def tasks_by
    start_date ||= @period.from_date
    end_date ||= Time.current
    column_chart @tasks.group_by_week('performed_on', format: '%d %b %Y', range: start_date..end_date).sum(:hours), ytitle: "Hours"
  end
end
