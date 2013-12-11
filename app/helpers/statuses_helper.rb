module StatusesHelper
  def color_options
    t('options.color').to_a.map(&:reverse)
  end
end