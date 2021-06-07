json.extract! delete_request, :id, :code, :billing, :contact_type, :contact_name, :phone, :email, :user_id, :compleated, :created_at, :updated_at
json.url delete_request_url(delete_request, format: :json)
