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

  def input_for(form_builder, column)
    case column.type
    when :integer
      form_builder.number_field column.name
    when :datetime
      form_builder.datetime_field column.name
    else
      form_builder.text_field column.name
    end
  end
end
