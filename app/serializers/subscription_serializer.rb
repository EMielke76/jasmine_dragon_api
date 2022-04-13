class SubscriptionSerializer
  include JSONAPI::Serializer
  set_id :id
  set_type :subscription
  attributes :user_id, :tea_id, :tea_name, :price, :status, :frequency
end
