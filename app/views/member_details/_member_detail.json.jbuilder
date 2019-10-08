json.extract! member_detail, :id, :name, :member_id, :member_code, :stype, :group, :company, :description, :facility, :active, :group_id, :created_at, :updated_at
json.url member_detail_url(member_detail, format: :json)
