json.extract! concerned_citizen_ticket, :id, :first, :last, :email, :state, :city, :zip, :address, :description, :notify_citizen, :created_at, :updated_at
json.url concerned_citizen_ticket_url(concerned_citizen_ticket, format: :json)
