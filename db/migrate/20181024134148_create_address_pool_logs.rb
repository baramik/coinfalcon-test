class CreateAddressPoolLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :address_pool_logs do |t|
      t.string :status
      t.datetime :last_run

      t.timestamps
    end
  end
end
