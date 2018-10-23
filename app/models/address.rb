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
    return address_pool.update!(unassigned_address_count:  address_pool.unassigned_address_count - 1) if address_pool.addresses.any? && user
    address_pool.update!(unassigned_address_count:  address_pool.unassigned_address_count + 1) if new_record?
  end
end
