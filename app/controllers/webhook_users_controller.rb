# frozen_string_literal: true

class WebhookUsersController < ApplicationController
  def create
    webhook_user = WebhookUser.new webhook_user_params

    if webhook_user.save
      render json: webhook_user
    else
      render json: { errors: webhook_user.errors }, status: 400
    end
  end

  def destroy
    webhook_user = WebhookUser.find params[:id]

    if webhook_user.destroy
      hdead :ok
    else
      head 400
    end
  end

  private

  def webhook_user_params
    params.permit(:name, :url)
  end
end
