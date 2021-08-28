# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @resources = User.all
    render 'shared/index'
  end
end
