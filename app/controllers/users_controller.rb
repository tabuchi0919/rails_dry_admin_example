# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @resources = User.all
    render 'shared/index'
  end

  def new
    @resource = User.new
    render 'shared/new'
  end
end
