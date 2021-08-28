# frozen_string_literal: true

Rails.application.routes.draw do
  root 'root#show'
  ApplicationController::ADMIN_EDITABLE_CLASSES.each do |klass|
    resources klass.model_name.route_key,
              only: %i[index new create edit update destroy]
  end
end
