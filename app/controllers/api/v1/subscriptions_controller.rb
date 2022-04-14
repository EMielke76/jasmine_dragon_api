class Api::V1::SubscriptionsController < ApplicationController

  def index
    json_response(User.find(params[:user_id]).subscriptions, :ok)
  end

  def create
    sub = Subscription.create(subscription_params)
    if sub.save
      json_response(SubscriptionSerializer.new(sub), :created)
    else
      render json: { status: 400, message: "#{sub.errors.full_messages.to_sentence}", data:{} }, status: :bad_request
    end
  end

  def update
    sub = Subscription.update(params[:id], update_params)
    if sub.save
      json_response(SubscriptionSerializer.new(sub), :ok)
    else
      render json: { status: 400, message: "#{sub.errors.full_messages.to_sentence}", data:{} }, status: :bad_request
    end
    rescue ActiveRecord::RecordNotFound
      save_and_continue
  end

  def destroy
    Subscription.find(params[:id]).destroy
    rescue ActiveRecord::RecordNotFound
      save_and_continue
  end

  private
  def subscription_params
    params.require(:subscription).permit(:user_id, :tea_id, :tea_name, :status, :frequency)
  end

  def update_params
    params.require(:subscription).permit(:status, :frequency)
  end
end
