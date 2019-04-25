class AddBillingToCodes < ActiveRecord::Migration[5.2]
  def change
    add_column :codes, :billing, :string
  end
end
