class Address < ApplicationRecord
  belongs_to :address_pool
  belongs_to :user, required: false

  before_save :set_descriptor
  after_commit :recalculate_unassigned_pool_count, on: [:create, :update]

  private

  def set_descriptor
    self.descriptor = RandomStringGeneratorService.new.call
  end 

  def recalculate_unassigned_pool_count
    if address_pool.addresses.any? && user 
      return address_pool.update!(unassigned_address_count:  address_pool.unassigned_address_count - 1)
    end
    address_pool.update!(unassigned_address_count:  address_pool.unassigned_address_count + 1)
  end
end
