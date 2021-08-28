# frozen_string_literal: true

module ApplicationHelper
  def format_for_table(value)
    case value
    when Date, DateTime, Time
      l(value)
    else
      value
    end
  end
end
