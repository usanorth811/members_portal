json.extract! notification, :id, :group_id, :delivery_id, :concerned_citizen_ticket_id, :description, :created_at, :updated_at
json.url notification_url(notification, format: :json)
