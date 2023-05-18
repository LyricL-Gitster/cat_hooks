# frozen_string_literal: true

class VehiclesController < ApplicationController
  def index
    render json: Vehicle.all
  end

  def show
    vehicle = Vehicle.find params[:id]
    render json: vehicle
  end

  def create
    vehicle = Vehicle.new vehicle_params

    if vehicle.save
      notify_webhook_users_async
      render json: vehicle
    else
      render json: { errors: vehicle.errors }, status: 400
    end
  end

  def update
    vehicle = Vehicle.find params[:id]

    if vehicle.update(vehicle_params)
      notify_webhook_users_async
      render json: vehicle
    else
      render json: { errors: vehicle.errors }, status: 400
    end
  end

  def destroy
    vehicle = Vehicle.find params[:id]

    if vehicle.destroy
      notify_webhook_users_async
      head :ok
    else
      head 400
    end
  end

  private

  def vehicle_params
    params.permit(:name, :count)
  end

  def notify_webhook_users_async
    WebhookUserService.notify_all_async!
  end
end
