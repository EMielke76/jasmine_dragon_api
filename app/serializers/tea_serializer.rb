class TeaSerializer
  include JSONAPI::Serializer
  set_id :id
  set_type :tea
  attributes :name, :description, :keywords, :origin, :brew_time, :temperature
end
