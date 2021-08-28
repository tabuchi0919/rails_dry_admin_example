# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @resources = User.all
    render 'shared/index'
  end

  def new
    @resource = User.new
    render 'shared/form'
  end

  def create
    @resource = User.new(permitted_params)
    if @resource.save
      redirect_to User, notice: t('flash.success.create')
    else
      flash.now[:alert] = t('flash.failure.create')
      flash.now[:error] = @resource.errors.full_messages
      render 'shared/form'
    end
  end

  def edit
    @resource = User.find(params[:id])
    render 'shared/form'
  end

  def update
    @resource = User.find(params[:id])
    if @resource.update(permitted_params)
      redirect_to User, notice: t('flash.success.update')
    else
      flash.now[:alert] = t('flash.failure.update')
      flash.now[:error] = @resource.errors.full_messages
      render 'shared/form'
    end
  end

  def destroy
    @resource = User.find(params[:id])
    if @resource.destroy
      redirect_to User, notice: t('flash.success.destroy')
    else
      flash.now[:error] = @resource.errors.full_messages
      redirect_to User, alert: t('flash.failure.destroy')
    end
  end

  private

  def permitted_params
    params.require(:user).permit(
      User.editable_columns.map(&:name)
    )
  end
end
