module StatusesHelper
  def color_options
    %w(blue green yellow red).map do |color|
      [color.titleize, color]
    end
  end
end