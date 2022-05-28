class Vehicles < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicles do |t|
      t.string  :reg_number, null: false
      t.string  :mark, null: false
      t.string  :model, null: false
      t.string  :prod_year, null: false

      t.timestamps
    end

  end
end
