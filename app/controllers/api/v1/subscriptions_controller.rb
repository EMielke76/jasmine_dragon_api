class Api::V1::SubscriptionsController < ApplicationController

  def create
    sub = Subscription.create(subscription_params)
    if sub.save
      json_response(SubscriptionSerializer.new(sub), :created)
    else
      render json: { status: 400, message: "#{sub.errors.full_messages.to_sentence}", data:{} }, status: :bad_request
    end
  end

  def destroy
    Subscription.find(params[:id]).destroy
  end

  private
  def subscription_params
    params.require(:subscription).permit(:user_id, :tea_id, :tea_name, :status, :frequency)
  end
end
