module EntriesHelper
  def estimate_options
    [1, 2, 3, 5, 8, 13, 20, 40, 100]
  end

  def status_options
    current_project.statuses.order(:closing, :name).reverse
  end
end
