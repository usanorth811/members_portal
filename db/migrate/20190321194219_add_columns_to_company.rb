class AddColumnsToCompany < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :status, :string
    add_column :companies, :member_type, :string
  end
end
