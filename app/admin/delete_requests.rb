ActiveAdmin.register DeleteRequest do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :code, :billing, :contact_type, :contact_name, :phone, :email, :user_id, :completed, :contact_number
  #
  # or
  #
  # permit_params do
  #   permitted = [:code, :billing, :contact_type, :contact_name, :phone, :email, :user_id, :completed, :contact_number]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    selectable_column
    id_column
    column :code
    column :contact_type
    column :contact_name
    column :phone
    column :email
    column :user
    column :completed
    column :created_at
    actions
  end

  filter :code
  filter :contact_type
  filter :contact_name
  filter :phone
  filter :email
  filter :user
  filter :completed
  filter :created_at

end
