json.extract! member_contact, :id, :name, :ip, :member_id, :member_code, :contact_id, :type, :company, :contact_name, :address1, :address2, :city, :state, :zip, :phone, :phone_ext, :email, :created_at, :updated_at
json.url member_contact_url(member_contact, format: :json)
