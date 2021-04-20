class CreateTipos < ActiveRecord::Migration[6.1]
  def change
    create_table :tipos do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
