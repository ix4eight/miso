class CreateLibraries < ActiveRecord::Migration[5.2]
  def change
    create_table :libraries do |t|
      t.integer :twitter,    null: false
      t.integer :line,       null: false
      t.integer :instagram,  null: false
      t.integer :discord,    null: false
      t.integer :steam,      null: false
      t.integer :skype,      null: false
      t.references :user,    foreign_key: true
      t.timestamps
    end
  end
end
