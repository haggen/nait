module EntriesHelper
  def estimate_options
    t('options.estimate').to_a.map(&:reverse)
  end

  def status_options
    current_project.statuses.order(:sort)
  end
end
