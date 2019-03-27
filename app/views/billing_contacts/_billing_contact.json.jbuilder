json.extract! billing_contact, :id, :name, :phone, :email, :addr, :company_id, :created_at, :updated_at
json.url billing_contact_url(billing_contact, format: :json)
