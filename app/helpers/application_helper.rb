# frozen_string_literal: true

module ApplicationHelper
  def format_for_table(resource, column)
    value = resource.send(column)

    if column.end_with?("_id")
      return User.find(value).display_name
    end

    case value
    when Date, DateTime, Time
      l(value)
    else
      value
    end
  end

  def label_for(form_builder, model, column)
    form_builder.label(
      model.human_attribute_name(column.name) + (column.null ? t('label.null_true') : t('label.null_false'))
    )
  end

  def input_for(form_builder, column)
    if column.name.end_with?("_id")
      return form_builder.select column.name, User.all.selections
    end

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
