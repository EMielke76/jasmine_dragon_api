module Rescue
  def save_and_continue
    render json: { status: 404, message: "Subscription Not Found", data:{} }, status: :not_found
  end
end
