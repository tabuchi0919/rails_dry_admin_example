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

  def create
    @resource = User.new(permitted_params)
    if @resource.save
      redirect_to User, notice: t('flash.success.create')
    else
      flash.now[:alert] = t('flash.failure.create')
      flash.now[:error] = @resource.errors.full_messages
      render 'shared/new'
    end
  end

  private

  def permitted_params
    params.require(:user).permit(
      User.editable_columns.map(&:name)
    )
  end
end
