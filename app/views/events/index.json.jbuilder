json.array!(@events) do |event|
  json.extract! event, :id, :event, :evnt_discr, :evt_date
  json.url event_url(event, format: :json)
end
