class RenameGroupToGroupCode < ActiveRecord::Migration[5.2]
  def change
    rename_column :member_details, :group, :group_code
  end
end
