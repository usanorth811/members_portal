class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    def change
      rename_column :member_contacts, :contact_type, :contact_type
    end
  end
end
