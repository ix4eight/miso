class ChangeColumnOfLibraries < ActiveRecord::Migration[5.2]
  def change
    def up
      change_column :libraries, :twitter, :integer, default: 0, null: false
      change_column :libraries, :line, :integer, default: 0, null: false
      change_column :libraries, :instagram, :integer, default: 0, null: false
      change_column :libraries, :discord, :integer, default: 0, null: false
      change_column :libraries, :steam, :integer, default: 0, null: false
      change_column :libraries, :skype, :integer, default: 0, null: false
    end

    def down
      change_column :libraries, :twitter, :integer, null: false
      change_column :libraries, :line, :integer, null: false
      change_column :libraries, :instagram, :integer, null: false
      change_column :libraries, :discord, :integer, null: false
      change_column :libraries, :steam, :integer, null: false
      change_column :libraries, :skype, :integer, null: false
    end
  end
end
