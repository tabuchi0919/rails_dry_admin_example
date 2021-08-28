# frozen_string_literal: true

class ApplicationController < ActionController::Base
  ADMIN_EDITABLE_CLASSES = [
    User
  ].freeze
end
