# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def set_color(value)
    if (value >= Evaluation::MAX_SCORE * 0.8)
      return " class='blue'"
    elsif (value <= Evaluation::MAX_SCORE * 0.4)
      return " class='red'"
    end
    ""
  end
end
