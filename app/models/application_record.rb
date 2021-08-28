# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  class << self
    # You can override this method to make some attribute uneditable.
    def uneditable_column_names
      %w[id created_at updated_at].to_set
    end

    def editable_columns
      columns.reject do |column|
        uneditable_column_names.include?(column.name)
      end
    end
  end
end
