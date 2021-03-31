json.extract! delivery, :id, :billing, :member_code, :group_id, :delivery_type, :deliver_to, :email, :phone, :city, :state, :zip, :created_at, :updated_at
json.url delivery_url(delivery, format: :json)
