class CreateCodestatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :codestatuses do |t|
      t.string :code
      t.boolean :sar_updated
      t.boolean :contacts_updated
      t.belongs_to :user, foreign_key: true
      t.belongs_to :group, foreign_key: true

      t.timestamps
    end
  end
end
