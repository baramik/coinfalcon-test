class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :descriptor
      t.belongs_to :address_pool, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
