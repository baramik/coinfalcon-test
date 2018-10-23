class CreateAddressPools < ActiveRecord::Migration[5.2]
  def change
    create_table :address_pools do |t|
      t.string :name
      t.integer :unassigned_address_count, default: 0

      t.timestamps
    end
  end
end
