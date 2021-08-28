# frozen_string_literal: true

class ApplicationController < ActionController::Base
  ADMIN_EDITABLE_CLASSES = [
    User
  ].freeze

  def index
    @resources = model.all
    render 'shared/index'
  end

  def new
    @resource = model.new
    render 'shared/form'
  end

  def create
    @resource = model.new(permitted_params)
    if @resource.save
      redirect_to model, notice: t('flash.success.create')
    else
      flash.now[:alert] = t('flash.failure.create')
      flash.now[:error] = @resource.errors.full_messages
      render 'shared/form'
    end
  end

  def edit
    @resource = model.find(params[:id])
    render 'shared/form'
  end

  def update
    @resource = model.find(params[:id])
    if @resource.update(permitted_params)
      redirect_to model, notice: t('flash.success.update')
    else
      flash.now[:alert] = t('flash.failure.update')
      flash.now[:error] = @resource.errors.full_messages
      render 'shared/form'
    end
  end

  def destroy
    @resource = model.find(params[:id])
    if @resource.destroy
      redirect_to model, notice: t('flash.success.destroy')
    else
      flash.now[:error] = @resource.errors.full_messages
      redirect_to model, alert: t('flash.failure.destroy')
    end
  end

  private

  def permitted_params
    params.require(model.model_name.singular).permit(
      model.editable_columns.map(&:name)
    )
  end

  def model
    raise NotInplementedError
  end
end
