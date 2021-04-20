class AddTipoIdToProduct < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :tipo_id, :integer
  end
end
